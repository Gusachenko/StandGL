import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.1 as QQ2

Entity {
    id: root
    property Material material

    Mesh {
        id:i_RotateMain3
        source: "/geometryObjects/stand/rotateMain3.obj"
    }

    property Material material_Rocket: EntityMaterial {
        effect: shadowMapEffectD                            //!!!!
        ambientLight: "#116000"
        diffuseColor: Qt.rgba( 0.11, 0.66, 0.0, 1.0 )
        specularColor: Qt.rgba(0.14, 0.84, 0.0, 1.0)
        shininess: 90.0
        opacity: 1.0
    }

    property Transform transform_Rocket: Transform {
        Scale {
            scale:  1.75
        }
        Rotate {
            id:rotateXaxis
            axis: Qt.vector3d(1, 0, 0)      // X-Axis /\ \/
        }
        Rotate {
            // Y-Axis <->
            id:rotateTaxis
           axis: Qt.vector3d(0, angleToRotate_Main3(rotateXaxis.angle,"axis_y"),
                              angleToRotate_Main3(rotateXaxis.angle,"axis_z"))
        }



        Rotate {
            id:rotateYaxis
            axis: Qt.vector3d(0, 1, 0)      // Y-Axis <->
        }
        Rotate {
            id:rotateZaxis
            axis: Qt.vector3d(0, 0, 1)      // Z-Axis :l:
        }
        Translate {
            translation: Qt.vector3d(0, 3.8, 0)
        }

    }
    components: [ i_RotateMain3, material_Rocket, transform_Rocket ]



    QQ2.NumberAnimation {
        id: toRotateYaxis
        target: rotateYaxis

        running: true
        loops: QQ2.Animation.Infinite

        property: "angle"
        duration: 1000
        from: 0
        to: 360
    }
    QQ2.NumberAnimation {
        target: rotateXaxis

        running: true
        loops: QQ2.Animation.Infinite

        property: "angle"
        duration: 1000
        from: 0
        to: 360
    }

    QQ2.NumberAnimation {
        target: rotateTaxis

        running: true
        loops: QQ2.Animation.Infinite

        property: "angle"
        duration: 1000
        from: 0
        to: 360
    }

}



