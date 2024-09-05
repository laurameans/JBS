//
//  Vectors.swift
//  JBS
//
//  Created by Justin Means on 9/2/24.
//

#if !os(Linux)
import simd

public typealias Vector3 = SIMD3<Float>
public typealias Vector4 = SIMD4<Float>

public extension simd_float4 {
    var xyz: SIMD3<Float> {
        SIMD3<Float>(x, y, z)
    }
}

public extension simd_quatf {
    var eulerAngles: (roll: Float, pitch: Float, yaw: Float) {
        let q = vector
        let sinr_cosp = 2 * (q.w * q.x + q.y * q.z)
        let cosr_cosp = 1 - 2 * (q.x * q.x + q.y * q.y)
        let roll = atan2(sinr_cosp, cosr_cosp)
        
        let sinp = 2 * (q.w * q.y - q.z * q.x)
        let pitch = abs(sinp) >= 1 ? copysign(.pi / 2, sinp) : asin(sinp)
        
        let siny_cosp = 2 * (q.w * q.z + q.x * q.y)
        let cosy_cosp = 1 - 2 * (q.y * q.y + q.z * q.z)
        let yaw = atan2(siny_cosp, cosy_cosp)
        
        return (roll, pitch, yaw)
    }
}


#endif
