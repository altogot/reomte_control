// Auto-generated. Do not edit!

// (in-package msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class controller {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.control_flag = null;
      this.brake_flag = null;
      this.gear_flag = null;
      this.gear_to_set = null;
      this.speed = null;
      this.acceleration = null;
      this.wheel_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('control_flag')) {
        this.control_flag = initObj.control_flag
      }
      else {
        this.control_flag = false;
      }
      if (initObj.hasOwnProperty('brake_flag')) {
        this.brake_flag = initObj.brake_flag
      }
      else {
        this.brake_flag = false;
      }
      if (initObj.hasOwnProperty('gear_flag')) {
        this.gear_flag = initObj.gear_flag
      }
      else {
        this.gear_flag = false;
      }
      if (initObj.hasOwnProperty('gear_to_set')) {
        this.gear_to_set = initObj.gear_to_set
      }
      else {
        this.gear_to_set = 0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration')) {
        this.acceleration = initObj.acceleration
      }
      else {
        this.acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_angle')) {
        this.wheel_angle = initObj.wheel_angle
      }
      else {
        this.wheel_angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controller
    // Serialize message field [control_flag]
    bufferOffset = _serializer.bool(obj.control_flag, buffer, bufferOffset);
    // Serialize message field [brake_flag]
    bufferOffset = _serializer.bool(obj.brake_flag, buffer, bufferOffset);
    // Serialize message field [gear_flag]
    bufferOffset = _serializer.bool(obj.gear_flag, buffer, bufferOffset);
    // Serialize message field [gear_to_set]
    bufferOffset = _serializer.uint8(obj.gear_to_set, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float32(obj.speed, buffer, bufferOffset);
    // Serialize message field [acceleration]
    bufferOffset = _serializer.float32(obj.acceleration, buffer, bufferOffset);
    // Serialize message field [wheel_angle]
    bufferOffset = _serializer.float32(obj.wheel_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controller
    let len;
    let data = new controller(null);
    // Deserialize message field [control_flag]
    data.control_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [brake_flag]
    data.brake_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [gear_flag]
    data.gear_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [gear_to_set]
    data.gear_to_set = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acceleration]
    data.acceleration = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [wheel_angle]
    data.wheel_angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs/controller';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8fa6cc1077b0e6ad3e8d031a45a0fd67';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool control_flag
    
    bool brake_flag
    
    bool gear_flag
    
    uint8 gear_to_set
    
    float32 speed
    
    float32 acceleration
    
    float32 wheel_angle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new controller(null);
    if (msg.control_flag !== undefined) {
      resolved.control_flag = msg.control_flag;
    }
    else {
      resolved.control_flag = false
    }

    if (msg.brake_flag !== undefined) {
      resolved.brake_flag = msg.brake_flag;
    }
    else {
      resolved.brake_flag = false
    }

    if (msg.gear_flag !== undefined) {
      resolved.gear_flag = msg.gear_flag;
    }
    else {
      resolved.gear_flag = false
    }

    if (msg.gear_to_set !== undefined) {
      resolved.gear_to_set = msg.gear_to_set;
    }
    else {
      resolved.gear_to_set = 0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.acceleration !== undefined) {
      resolved.acceleration = msg.acceleration;
    }
    else {
      resolved.acceleration = 0.0
    }

    if (msg.wheel_angle !== undefined) {
      resolved.wheel_angle = msg.wheel_angle;
    }
    else {
      resolved.wheel_angle = 0.0
    }

    return resolved;
    }
};

module.exports = controller;
