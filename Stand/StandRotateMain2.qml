import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.1 as QQ2

Entity {
    id: root
    property Material material

    Mesh {
        id:i_RotateMain2
        source: "/geometryObjects/stand/rotateMain2.obj"
    }

    property Material material_Rocket: EntityMaterial {
        effect: shadowMapEffectD                            //!!!!
        ambientLight: "#706565"
        diffuseColor: Qt.rgba( 0.76, 0.72, 0.72, 1.0 )
        specularColor: Qt.rgba(0.95, 0.92, 0.92, 1.0)
        shininess: 50.0
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
            id:rotateYaxis
            axis: Qt.vector3d(0, 1, 0)      // Y-Axis <->
        }
        Rotate {
            axis: Qt.vector3d(0, 0, 1)      // Z-Axis :l:
            angle: 0
        }
        Translate {
            translation: Qt.vector3d(0, 3.8, 0)
        }

    }
    components: [ i_RotateMain2, material_Rocket, transform_Rocket ]


    QQ2.NumberAnimation {
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
}
