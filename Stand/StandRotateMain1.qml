import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.1 as QQ2

Entity {
    id: root
    property Material material

    Mesh {
        id:i_RotateMain1
        source: "/geometryObjects/stand/rotateMain1.obj"
    }

    property Material material_Rocket: EntityMaterial {
        effect: shadowMapEffectD                            //!!!!
        ambientLight: "#BD0000"
        diffuseColor: Qt.rgba( 0.1, 0.1, 0.1, 1.0 )
        specularColor: Qt.rgba(1.0, 1.0, 1.0, 1.0)
        shininess: 80.0
        opacity: 1.0
    }

    property Transform transform_Rocket: Transform {
        Scale {
            scale:  1.75
        }
        Rotate {
            axis: Qt.vector3d(1, 0, 0)      // X-Axis /\ \/
            angle: 0
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
            translation: Qt.vector3d(0, 0, 0)
        }

    }
    components: [ i_RotateMain1, material_Rocket, transform_Rocket ]


    QQ2.NumberAnimation {
        target: rotateYaxis

        running: true
        loops: QQ2.Animation.Infinite

        property: "angle"
        duration: 1000
        from: 0
        to: 360
    }

}


