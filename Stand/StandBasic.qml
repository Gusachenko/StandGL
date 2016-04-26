import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.1 as QQ2

Entity {
    id: root
    property Material material

    Mesh {
        id: i_StandBasic
        source: "/geometryObjects/stand/basic.obj"
    }

    property Material material_Rocket: EntityMaterial {
        effect: shadowMapEffectD                            //!!!!
        ambientLight: "#A80000"
        diffuseColor: Qt.rgba( 1.0, 0.0, 0.0, 1.0 )
        specularColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
        shininess: 50.0
        opacity: 1.0
    }

    property Transform transform_Rocket: Transform {
        Scale {
            scale:  1.75
        }
        Rotate {
            axis: Qt.vector3d(0, 1, 0)
            angle:  0
        }
        Rotate {
            axis: Qt.vector3d(0, 0, 1)
            angle: 0
        }
        Translate {
            translation: Qt.vector3d(0, 1, 0)
        }

    }

    components: [ i_StandBasic, material_Rocket, transform_Rocket ]
}
