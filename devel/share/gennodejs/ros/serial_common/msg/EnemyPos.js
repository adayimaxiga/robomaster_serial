// Auto-generated. Do not edit!

// (in-package serial_common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class EnemyPos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enemy_dist = null;
      this.enemy_yaw = null;
      this.enemy_pitch = null;
      this.mode = null;
    }
    else {
      if (initObj.hasOwnProperty('enemy_dist')) {
        this.enemy_dist = initObj.enemy_dist
      }
      else {
        this.enemy_dist = 0;
      }
      if (initObj.hasOwnProperty('enemy_yaw')) {
        this.enemy_yaw = initObj.enemy_yaw
      }
      else {
        this.enemy_yaw = 0;
      }
      if (initObj.hasOwnProperty('enemy_pitch')) {
        this.enemy_pitch = initObj.enemy_pitch
      }
      else {
        this.enemy_pitch = 0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EnemyPos
    // Serialize message field [enemy_dist]
    bufferOffset = _serializer.int32(obj.enemy_dist, buffer, bufferOffset);
    // Serialize message field [enemy_yaw]
    bufferOffset = _serializer.int32(obj.enemy_yaw, buffer, bufferOffset);
    // Serialize message field [enemy_pitch]
    bufferOffset = _serializer.int32(obj.enemy_pitch, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.int32(obj.mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EnemyPos
    let len;
    let data = new EnemyPos(null);
    // Deserialize message field [enemy_dist]
    data.enemy_dist = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [enemy_yaw]
    data.enemy_yaw = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [enemy_pitch]
    data.enemy_pitch = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_common/EnemyPos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd278822d8acfbc3aa6895b78b02afb89';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 enemy_dist
    int32 enemy_yaw
    int32 enemy_pitch
    int32 mode 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EnemyPos(null);
    if (msg.enemy_dist !== undefined) {
      resolved.enemy_dist = msg.enemy_dist;
    }
    else {
      resolved.enemy_dist = 0
    }

    if (msg.enemy_yaw !== undefined) {
      resolved.enemy_yaw = msg.enemy_yaw;
    }
    else {
      resolved.enemy_yaw = 0
    }

    if (msg.enemy_pitch !== undefined) {
      resolved.enemy_pitch = msg.enemy_pitch;
    }
    else {
      resolved.enemy_pitch = 0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    return resolved;
    }
};

module.exports = EnemyPos;
