import Qt3D 2.0
import Qt3D.Renderer 2.0

Entity {
    id: root

    property alias near: lightCamera.nearPlane
    property alias ratio: lightCamera.aspectRatio

    property vector3d lightPosition: Qt.vector3d(0.0, 90.0, 30.0)
    property vector3d lightIntensity: Qt.vector3d(1.0, 1.0, 1.0)

    readonly property Camera lightCamera: lightCamera
    readonly property matrix4x4 lightViewProjection:
        lightCamera.projectionMatrix.times(lightCamera.matrix)

    Camera {
        id: lightCamera
        objectName: "lightCameraLens"
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 30
        nearPlane: 2500000.0
        farPlane: 10000000.0
        position: root.lightPosition
        viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
    }
}

