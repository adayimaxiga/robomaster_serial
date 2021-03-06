#ifndef SERIAL_COMMON
#define SERIAL_COMMON

#include <ctime>
#include <cmath>
#include <sys/ioctl.h>
#include <sys/fcntl.h>
#include <sys/termios.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>
#include <fstream>
#include <string>
#include <mutex>
#include <thread>
#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include "serial_common/EnemyPos.h"
#include "serial_common/Infantrymode.h"


#include <stdio.h>
#include <stdint.h>

#define UP_REG_ID    0xA0
#define DN_REG_ID    0xA5
#define HEADER_LEN   sizeof(FrameHeader)
#define CMD_LEN      2
#define CRC_LEN      2
#define PROTOCAL_FRAME_MAX_SIZE  200
#define UART_BUFF_SIZE           2000
#define PACK_MAX_SIZE            200
#define COMPRESS_TIME            1
/**
  * @brief  command id
  */
typedef enum {
  GAME_INFO_ID = 0x0001,
  REAL_BLOOD_DATA_ID = 0x0002,
  REAL_SHOOT_DATA_ID = 0x0003,
  REAL_RFID_DATA_ID = 0x0005,
  GAME_RESULT_ID = 0x0006,
  GAIN_BUFF_ID = 0x0007,

  CHASSIS_DATA_ID = 0x0010,
  GIMBAL_DATA_ID = 0x0011,
  SHOOT_TASK_DATA_ID = 0x0012,
  INFANTRY_ERR_ID = 0x0013,
  CONFIG_RESPONSE_ID = 0x0014,
  CALI_RESPONSE_ID = 0x0015,
  REMOTE_CTRL_INFO_ID = 0x0016,
  BOTTOM_VERSION_ID = 0x0017,

  CHASSIS_CTRL_ID = 0x00A0,
  GIMBAL_CTRL_ID = 0x00A1,
  SHOOT_CTRL_ID = 0x00A2,
  ERROR_LEVEL_ID = 0x00A3,
  INFANTRY_STRUCT_ID = 0x00A4,
  CALI_GIMBAL_ID = 0x00A5,

  CLIENT_SHOW_ID = 0x0100,
  USER_TO_SERVER_ID = 0x0101,
  SERVER_TO_USER_ID = 0x0102,


  INFANTRY_BUFF_ID = 0x1000,
  INFANTRY_ENEMY_ID = 0x1001,

  INFANTRY_SHOOT_MODE_ID = 0x10A1,
} CommandID;

/* enumeration type data */

typedef enum {
  STEP_HEADER_SOF = 0,
  STEP_LENGTH_LOW = 1,
  STEP_LENGTH_HIGH = 2,
  STEP_FRAME_SEQ = 3,
  STEP_HEADER_CRC8 = 4,
  STEP_DATA_CRC16 = 5,
} UnpackStep;



typedef enum {
  CHASSIS_STOP = 1,
  MANUAL_SEPARATE_GIMBAL = 2,
  AUTO_SEPARATE_GIMBAL = 5,
  CRAZY_ROTATE_MODE =7,
} ChassisMode;

/**
  * @brief  frame header structure definition
  */
typedef struct {
  uint8_t sof;
  uint16_t data_length;
  uint8_t seq;
  uint8_t crc8;
} __attribute__((packed)) FrameHeader;

/************************ the control information from computer ************************/

typedef struct {
  int16_t x_offset;   /* offset(mm) relative to the x-axis of the chassis center */
  int16_t y_offset;   /* offset(mm) relative to the y-axis of the chassis center */
  float w_speed;    /* rotation speed(degree/s) of chassis */
} __attribute__((packed)) ChassisRotate;

/**
  * @brief  chassis control information(0x00A0)
  */
typedef struct {
  uint8_t ctrl_mode; /* chassis control mode */
  int16_t x_speed;   /* x-axis move speed(mm/s) of chassis */
  int16_t y_speed;   /* y-axis move speed(mm/s) of chassis */
  ChassisRotate w_info;    /* rotation control of chassis */
} __attribute__((packed)) ChassisControl;

/**
  * @brief  gimbal control information(0x00A1)
  */
typedef struct {
  int32_t enemy_dist;
  int32_t enemy_yaw;      /* gimbal pitch reference angle(degree) */
  int32_t enemy_pitch;      /* gimbal yaw reference angle(degree) */
  int32_t mode; /* visual information valid or not */
} __attribute__((packed)) GimbalShootControl;

typedef struct {
  int32_t mode; /* visual information valid or not */
} __attribute__((packed)) GimbalMode;



static const uint16_t kCrc = 0xffff;
static constexpr uint16_t kCrcTable[256] = {
    0x0000, 0x1189, 0x2312, 0x329b, 0x4624, 0x57ad, 0x6536, 0x74bf,
    0x8c48, 0x9dc1, 0xaf5a, 0xbed3, 0xca6c, 0xdbe5, 0xe97e, 0xf8f7,
    0x1081, 0x0108, 0x3393, 0x221a, 0x56a5, 0x472c, 0x75b7, 0x643e,
    0x9cc9, 0x8d40, 0xbfdb, 0xae52, 0xdaed, 0xcb64, 0xf9ff, 0xe876,
    0x2102, 0x308b, 0x0210, 0x1399, 0x6726, 0x76af, 0x4434, 0x55bd,
    0xad4a, 0xbcc3, 0x8e58, 0x9fd1, 0xeb6e, 0xfae7, 0xc87c, 0xd9f5,
    0x3183, 0x200a, 0x1291, 0x0318, 0x77a7, 0x662e, 0x54b5, 0x453c,
    0xbdcb, 0xac42, 0x9ed9, 0x8f50, 0xfbef, 0xea66, 0xd8fd, 0xc974,
    0x4204, 0x538d, 0x6116, 0x709f, 0x0420, 0x15a9, 0x2732, 0x36bb,
    0xce4c, 0xdfc5, 0xed5e, 0xfcd7, 0x8868, 0x99e1, 0xab7a, 0xbaf3,
    0x5285, 0x430c, 0x7197, 0x601e, 0x14a1, 0x0528, 0x37b3, 0x263a,
    0xdecd, 0xcf44, 0xfddf, 0xec56, 0x98e9, 0x8960, 0xbbfb, 0xaa72,
    0x6306, 0x728f, 0x4014, 0x519d, 0x2522, 0x34ab, 0x0630, 0x17b9,
    0xef4e, 0xfec7, 0xcc5c, 0xddd5, 0xa96a, 0xb8e3, 0x8a78, 0x9bf1,
    0x7387, 0x620e, 0x5095, 0x411c, 0x35a3, 0x242a, 0x16b1, 0x0738,
    0xffcf, 0xee46, 0xdcdd, 0xcd54, 0xb9eb, 0xa862, 0x9af9, 0x8b70,
    0x8408, 0x9581, 0xa71a, 0xb693, 0xc22c, 0xd3a5, 0xe13e, 0xf0b7,
    0x0840, 0x19c9, 0x2b52, 0x3adb, 0x4e64, 0x5fed, 0x6d76, 0x7cff,
    0x9489, 0x8500, 0xb79b, 0xa612, 0xd2ad, 0xc324, 0xf1bf, 0xe036,
    0x18c1, 0x0948, 0x3bd3, 0x2a5a, 0x5ee5, 0x4f6c, 0x7df7, 0x6c7e,
    0xa50a, 0xb483, 0x8618, 0x9791, 0xe32e, 0xf2a7, 0xc03c, 0xd1b5,
    0x2942, 0x38cb, 0x0a50, 0x1bd9, 0x6f66, 0x7eef, 0x4c74, 0x5dfd,
    0xb58b, 0xa402, 0x9699, 0x8710, 0xf3af, 0xe226, 0xd0bd, 0xc134,
    0x39c3, 0x284a, 0x1ad1, 0x0b58, 0x7fe7, 0x6e6e, 0x5cf5, 0x4d7c,
    0xc60c, 0xd785, 0xe51e, 0xf497, 0x8028, 0x91a1, 0xa33a, 0xb2b3,
    0x4a44, 0x5bcd, 0x6956, 0x78df, 0x0c60, 0x1de9, 0x2f72, 0x3efb,
    0xd68d, 0xc704, 0xf59f, 0xe416, 0x90a9, 0x8120, 0xb3bb, 0xa232,
    0x5ac5, 0x4b4c, 0x79d7, 0x685e, 0x1ce1, 0x0d68, 0x3ff3, 0x2e7a,
    0xe70e, 0xf687, 0xc41c, 0xd595, 0xa12a, 0xb0a3, 0x8238, 0x93b1,
    0x6b46, 0x7acf, 0x4854, 0x59dd, 0x2d62, 0x3ceb, 0x0e70, 0x1ff9,
    0xf78f, 0xe606, 0xd49d, 0xc514, 0xb1ab, 0xa022, 0x92b9, 0x8330,
    0x7bc7, 0x6a4e, 0x58d5, 0x495c, 0x3de3, 0x2c6a, 0x1ef1, 0x0f78
};
static const unsigned char kCrc8 = 0xff;
static constexpr unsigned char kCrcOctTable[256] = {
    0x00, 0x5e, 0xbc, 0xe2, 0x61, 0x3f, 0xdd, 0x83, 0xc2, 0x9c, 0x7e,
    0x20, 0xa3, 0xfd, 0x1f, 0x41, 0x9d, 0xc3, 0x21, 0x7f, 0xfc, 0xa2,
    0x40, 0x1e, 0x5f, 0x01, 0xe3, 0xbd, 0x3e, 0x60, 0x82, 0xdc, 0x23,
    0x7d, 0x9f, 0xc1, 0x42, 0x1c, 0xfe, 0xa0, 0xe1, 0xbf, 0x5d, 0x03,
    0x80, 0xde, 0x3c, 0x62, 0xbe, 0xe0, 0x02, 0x5c, 0xdf, 0x81, 0x63,
    0x3d, 0x7c, 0x22, 0xc0, 0x9e, 0x1d, 0x43, 0xa1, 0xff, 0x46, 0x18,
    0xfa, 0xa4, 0x27, 0x79, 0x9b, 0xc5, 0x84, 0xda, 0x38, 0x66, 0xe5,
    0xbb, 0x59, 0x07, 0xdb, 0x85, 0x67, 0x39, 0xba, 0xe4, 0x06, 0x58,
    0x19, 0x47, 0xa5, 0xfb, 0x78, 0x26, 0xc4, 0x9a, 0x65, 0x3b, 0xd9,
    0x87, 0x04, 0x5a, 0xb8, 0xe6, 0xa7, 0xf9, 0x1b, 0x45, 0xc6, 0x98,
    0x7a, 0x24, 0xf8, 0xa6, 0x44, 0x1a, 0x99, 0xc7, 0x25, 0x7b, 0x3a,
    0x64, 0x86, 0xd8, 0x5b, 0x05, 0xe7, 0xb9, 0x8c, 0xd2, 0x30, 0x6e,
    0xed, 0xb3, 0x51, 0x0f, 0x4e, 0x10, 0xf2, 0xac, 0x2f, 0x71, 0x93,
    0xcd, 0x11, 0x4f, 0xad, 0xf3, 0x70, 0x2e, 0xcc, 0x92, 0xd3, 0x8d,
    0x6f, 0x31, 0xb2, 0xec, 0x0e, 0x50, 0xaf, 0xf1, 0x13, 0x4d, 0xce,
    0x90, 0x72, 0x2c, 0x6d, 0x33, 0xd1, 0x8f, 0x0c, 0x52, 0xb0, 0xee,
    0x32, 0x6c, 0x8e, 0xd0, 0x53, 0x0d, 0xef, 0xb1, 0xf0, 0xae, 0x4c,
    0x12, 0x91, 0xcf, 0x2d, 0x73, 0xca, 0x94, 0x76, 0x28, 0xab, 0xf5,
    0x17, 0x49, 0x08, 0x56, 0xb4, 0xea, 0x69, 0x37, 0xd5, 0x8b, 0x57,
    0x09, 0xeb, 0xb5, 0x36, 0x68, 0x8a, 0xd4, 0x95, 0xcb, 0x29, 0x77,
    0xf4, 0xaa, 0x48, 0x16, 0xe9, 0xb7, 0x55, 0x0b, 0x88, 0xd6, 0x34,
    0x6a, 0x2b, 0x75, 0x97, 0xc9, 0x4a, 0x14, 0xf6, 0xa8, 0x74, 0x2a,
    0xc8, 0x96, 0x15, 0x4b, 0xa9, 0xf7, 0xb6, 0xe8, 0x0a, 0x54, 0xd7,
    0x89, 0x6b, 0x35
};

class SerialComNode
{
public:
  /**
   * @brief Constructor
   * @param module_name The name of the serial number
   */
  SerialComNode(void);

  /**
   * @brief Run the main process
   */
  void Run();

  ~SerialComNode();

  /**
     * @brief Stop the main process
     */
  void Stop();

  /**
   * @brief Restart the main process
   */
  void Resume();

private:
  /**
     * @brief Fetch the CRC data (1 Byte) from message
     */
    uint8_t GetCrcOctCheckSum(uint8_t *message, uint32_t length, uint8_t crc);

    /**
     * @brief Fetch the CRC data (2 Bytes) from message
     */
    uint16_t GetCrcHexCheckSum(uint8_t *message, uint32_t length, uint16_t crc);

    /**
     * @brief Verify the CRC (1 Byte)
     */
    bool VerifyCrcOctCheckSum(uint8_t *message, uint16_t length);

    /**
     * @brief Verify the CRC (2 Bytes)
     */
    bool VerifyCrcHexCheckSum(uint8_t *message, uint32_t length);

    /**
     * @brief Append CRC (1 Byte) to message
     */
    void AppendCrcOctCheckSum(uint8_t *message, uint16_t length);

    /**
     * @brief Append CRC (2 Bytes) to message
     */
    void AppendCrcHexCheckSum(uint8_t *message, uint32_t length);

    /**
     * @brief Serial port initialize.
     */
    bool SerialInitialization(std::string port, int baudrate, int flow_control, int data_bits, int stop_bits, int parity);

    /**
     * @brief Set the  boudrate of the serial port
     * @param boudrate The value to set
     */
    bool ConfigBaudrate(int boudrate);

    /**
     * @brief The thread function for getting data from embedded platform
     */
    void ReceiveLoop();

    /**
     * @brief Basic receive
     * @param fd The file discription to get data from.
     * @param data_length The max number of data to receive
     * @return The actual number of bytes received
     */
    int ReceiveData(int fd, int data_length);

    /**
     * @brief Unpacking the package message
     */
    void DataHandle();

    /**
     * @brief Pack raw information to message
     */
    void SendDataHandle(uint16_t cmd_id, uint8_t *topack_data, uint8_t *packed_data, uint16_t len);

    /**
     * @brief Send packed data
     */
    int SendData(int data_len);

    void GimbalEnemyControlCallback(const serial_common::EnemyPos::ConstPtr &msg);
    void GimbalBuffControlCallback(const serial_common::EnemyPos::ConstPtr &msg);


    void ChassisControlCallback(const geometry_msgs::Twist::ConstPtr &vel);

    void SendPack();

    FILE * fp_;
    int fd_, baudrate_, length_, pack_length_, total_length_, free_length_, key_, valid_key_;
    double length_column_, length_beam_;
    struct termios termios_options_, termios_options_original_;
    std::string port_;
    std::thread *receive_loop_thread_, *send_loop_thread_, *keyboard_in_;
    std::mutex mutex_receive_, mutex_send_, mutex_pack_;
    bool is_open_, stop_receive_, stop_send_, is_sim_, is_debug_, is_debug_tx_;
    ros::NodeHandle nh_;

    ros::Subscriber enemy_sub, buff_sub;
    ros::Publisher mode_pub_;

    UnpackStep unpack_step_e_;

    uint8_t byte_, rx_buf_[UART_BUFF_SIZE], tx_buf_[UART_BUFF_SIZE],
      protocol_packet_[PROTOCAL_FRAME_MAX_SIZE];
      uint16_t data_length_, computer_cmd_id_;
  int32_t read_len_, read_buff_index_, index_;
  GimbalShootControl gimbal_control_data_;
  ChassisControl chassis_control_data_;
  FrameHeader computer_frame_header_;
  GimbalMode Gimbal_mode_msg_;
};






#endif
