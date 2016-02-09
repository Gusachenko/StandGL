import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.0 as QQ2


Entity{
    id:i_MainEntitySpace


    function angleToRotate_Main3(value,axis){
        var axis_y=0.0;
        var axis_z=0.0;

        var procentOfValue=0.0;
        var valueForSteeling=0.0;

        var isRevers=false;
        if(value<0){

            value=-value;
            isRevers=true;
        }else isRevers=false;

        var iteratorOfAmountValue=Math.ceil(value/360);



        if(value>=360){
            value=360-((360*iteratorOfAmountValue)-value);
        }


        procentOfValue=(value/360)*100;
        valueForSteeling = procentOfValue*0.01;

            if(!isRevers){
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
            }else if(isRevers){
                if(procentOfValue<13){
                    valueForSteeling=(((procentOfValue)/12)*100)*0.01;
                    axis_y=-1.0;
                    axis_z=0.0+valueForSteeling;
                }else if(13<=procentOfValue && procentOfValue<25){
                    valueForSteeling=(((procentOfValue-13)/13)*100)*0.01;
                    axis_y=-1.0+valueForSteeling;
                    axis_z=1.0;
                }else if(25<=procentOfValue && procentOfValue<38){
                    valueForSteeling=(((procentOfValue-(25))/13)*100)*0.01;
                    axis_y=0.0+valueForSteeling;
                    axis_z=1.0;
                }else if(38<=procentOfValue && procentOfValue<50){
                    valueForSteeling=(((procentOfValue-(38))/13)*100)*0.01;
                    axis_y=1.0;
                    axis_z=1.0-valueForSteeling;
                }else if(50<=procentOfValue && procentOfValue<63){
                    valueForSteeling=(((procentOfValue-(50))/13)*100)*0.01;
                    axis_y=1.0;
                    axis_z=0.0-valueForSteeling;
                }else if(63<=procentOfValue && procentOfValue<75){
                    valueForSteeling=(((procentOfValue-(63))/13)*100)*0.01;
                    axis_y=1.0-valueForSteeling;
                    axis_z=-1.0;
                }else if(75<=procentOfValue && procentOfValue<87){
                    valueForSteeling=(((procentOfValue-(75))/13)*100)*0.01;
                    axis_y=0.0-valueForSteeling;
                    axis_z=-1.0;
                }else if(87<=procentOfValue && procentOfValue<100){
                    axis_y=-1.0;
                    axis_z=-1.0;
                }else if(procentOfValue<=100){
                    axis_y=-1.0;
                    axis_z=-1.0;
                }
            }

            if(axis=="axis_y")
                return axis_y
            else
            if(axis=="axis_z"){
                return axis_z;
            }
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
        position: Qt.vector3d( 0.0, 0.0, 30.0 )
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

    //StandRotateMain1:ENTITY
    Entity{
        property Material material_Rocket: EntityMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "#BD0000"
            diffuseColor: Qt.rgba( 1.0, 0.82, 0.82, 1.0 )
            specularColor: Qt.rgba(1.0, 1.0, 1.0, 1.0)
            shininess: 30.0
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
                angle: i_mainRoot.mainRoot_Slider_Y_Axis_Main1_Value
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
                axis: Qt.vector3d(1, 0, 0)      // X-Axis /\ \/
                angle: i_mainRoot.mainRoot_Slider_X_Axis_Main2_Value
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)      // Y-Axis <->
                angle: i_mainRoot.mainRoot_Slider_Y_Axis_Main1_Value
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
            ambientLight: "#116000"
            diffuseColor: Qt.rgba( 0.11, 0.66, 0.0, 1.0 )
            specularColor: Qt.rgba(0.14, 0.84, 0.0, 1.0)
            shininess: 50.0
            opacity: 1.0
        }

        property Transform transform_Rocket: Transform {
            Scale {
                scale:  1.75
            }
            Rotate {
                axis: Qt.vector3d(1, 0, 0)      // X-Axis /\ \/
                angle: i_mainRoot.mainRoot_Slider_X_Axis_Main2_Value
            }
            Rotate {
                // Y-Axis <->
               axis: Qt.vector3d(0, angleToRotate_Main3(i_mainRoot.mainRoot_Slider_X_Axis_Main2_Value,"axis_y"),
                                  angleToRotate_Main3(i_mainRoot.mainRoot_Slider_X_Axis_Main2_Value,"axis_z"))

                angle: i_mainRoot.mainRoot_Slider_Y_Axis_Main3_Value    // i_mainRoot.mainRoot_Slider_Y_Axis_Main3_Value
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)      // Y-Axis <->
                angle: i_mainRoot.mainRoot_Slider_Y_Axis_Main1_Value
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
