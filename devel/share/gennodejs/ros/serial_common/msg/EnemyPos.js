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
    }
    else {
      if (initObj.hasOwnProperty('enemy_dist')) {
        this.enemy_dist = initObj.enemy_dist
      }
      else {
        this.enemy_dist = 0.0;
      }
      if (initObj.hasOwnProperty('enemy_yaw')) {
        this.enemy_yaw = initObj.enemy_yaw
      }
      else {
        this.enemy_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('enemy_pitch')) {
        this.enemy_pitch = initObj.enemy_pitch
      }
      else {
        this.enemy_pitch = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EnemyPos
    // Serialize message field [enemy_dist]
    bufferOffset = _serializer.float64(obj.enemy_dist, buffer, bufferOffset);
    // Serialize message field [enemy_yaw]
    bufferOffset = _serializer.float64(obj.enemy_yaw, buffer, bufferOffset);
    // Serialize message field [enemy_pitch]
    bufferOffset = _serializer.float64(obj.enemy_pitch, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EnemyPos
    let len;
    let data = new EnemyPos(null);
    // Deserialize message field [enemy_dist]
    data.enemy_dist = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [enemy_yaw]
    data.enemy_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [enemy_pitch]
    data.enemy_pitch = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_common/EnemyPos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd2e463cd0aba84496a9caa0872b932d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 enemy_dist
    float64 enemy_yaw
    float64 enemy_pitch
    
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
      resolved.enemy_dist = 0.0
    }

    if (msg.enemy_yaw !== undefined) {
      resolved.enemy_yaw = msg.enemy_yaw;
    }
    else {
      resolved.enemy_yaw = 0.0
    }

    if (msg.enemy_pitch !== undefined) {
      resolved.enemy_pitch = msg.enemy_pitch;
    }
    else {
      resolved.enemy_pitch = 0.0
    }

    return resolved;
    }
};

module.exports = EnemyPos;
