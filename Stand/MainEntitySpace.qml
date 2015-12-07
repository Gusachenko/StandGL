import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.0 as QQ2


Entity{
    id:i_MainEntitySpace
    property real test_val: 0.1

    function testmove(){return test_val=test_val+0.1;}
    function angleToRotate_Main3(value,axis){
        var axis_y=0.0;
        var axis_z=0.0;

        var procentOfValue=0.0;
        var valueForSteeling=0.0;

        procentOfValue=(value/360)*100;
        valueForSteeling = procentOfValue*0.01;

            if(procentOfValue<25){
                valueForSteeling=((procentOfValue/24)*100)*0.01;

                axis_y=1.0-valueForSteeling;
                axis_z=0.0+valueForSteeling;
            }else
            if(25<=procentOfValue && procentOfValue<50){
                valueForSteeling=(((procentOfValue-25)/25)*100)*0.01;

                axis_y=0.0-valueForSteeling;
                axis_z=1.0-valueForSteeling;
            }else
            if(50<=procentOfValue && procentOfValue<75){
                valueForSteeling=(((procentOfValue-50)/25)*100)*0.01;

                axis_y=1.0-valueForSteeling;
                axis_z=0.0+valueForSteeling;
            }else
            if(75<=procentOfValue<100){
                valueForSteeling=(((procentOfValue-75)/25)*100)*0.01;

                axis_y=0.0-valueForSteeling;
                axis_z=1.0-valueForSteeling;
            }else
            if(100<=procentOfValue){
                valueForSteeling=(((procentOfValue-75)/25)*100)*0.01;

                axis_y=1.0+valueForSteeling;
                axis_z=0.0-valueForSteeling;
            }

            if(axis=="axis_y")
                return axis_y
            else
            if(axis=="axis_z")
                return axis_z;
    }

    Light{
        id: light
        ratio: width / height
    }

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 60
        aspectRatio: width / height
        nearPlane: 0.01
        farPlane: 1000.0
        position: Qt.vector3d( 0.0, 0.0, 25.0 )
        upVector:  Qt.vector3d(0, 1, 0)
        viewCenter: Qt.vector3d( 0, 0, 0 )
    }

    Configuration  {
        controlledCamera: camera
    }

    components: [
        EntityFrameGraph {          //ФОН сцены
            id: framegraph
            viewCamera: camera
            lightCamera: light.lightCamera
        }
    ]


//    //    //


    EntityShadowEffect{                                         //!!!!
        id: shadowMapEffectD
        shadowTexture: framegraph.shadowTexture
        light: light
    }

    //OBJECTS
    StandBasic{
        id:i_StandBasic
    }
    StandRotateMain1{
        id:i_RotateMain1
    }
    StandRotateMain2{
        id:i_RotateMain2
    }
    StandRotateMain3{
        id:i_RotateMain3
    }


    //StandBasic:ENTITY
    Entity{
        property Material material_Rocket: EntityMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "red"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
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

    //StandRotateMain1:ENTITY
    Entity{
        property Material material_Rocket: EntityMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "#F03939"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
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
                axis: Qt.vector3d(0, 1, 0)      // Y-Axis <->
                angle: slider_Y_Axis_Main1.value
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
    }

    //StandRotateMain2:ENTITY
    Entity{
        property Material material_Rocket: EntityMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "white"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
            opacity: 1.0
        }

        property Transform transform_Rocket: Transform {
            Scale {
                scale:  1.75
            }
            Rotate {
                axis: Qt.vector3d(1, 0, 0)      // X-Axis /\ \/
                angle: slider_X_Axis_Main2.value
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)      // Y-Axis <->
                angle: slider_Y_Axis_Main1.value
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
    }

    //StandRotateMain3:ENTITY
    Entity{
        property Material material_Rocket: EntityMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "#259C7E"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
            opacity: 1.0
        }

        property Transform transform_Rocket: Transform {
            Scale {
                scale:  1.75
            }
            Rotate {
                axis: Qt.vector3d(1, 0, 0)      // X-Axis /\ \/
                angle: slider_X_Axis_Main2.value
            }
            Rotate {
                axis: Qt.vector3d(0, angleToRotate_Main3(slider_X_Axis_Main2.value,"axis_y"),
                                  angleToRotate_Main3(slider_X_Axis_Main2.value,"axis_z"))      // Y-Axis <->
                angle: slider_Y_Axis_Main3.value
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)      // Y-Axis <->
                angle: slider_Y_Axis_Main1.value
            }
            Rotate {
                axis: Qt.vector3d(0, 0, 1)      // Z-Axis :l:
                angle: 0
            }
            Translate {
                translation: Qt.vector3d(0, 3.8, 0)
            }

        }
        components: [ i_RotateMain3, material_Rocket, transform_Rocket ]
    }
}
