import Qt3D.Core 2.0
import Qt3D.Render 2.0

Entity {
    id: root
    property Material material

    PlaneMesh {
        id: groundMesh
        width: 150
        height: width
        meshResolution: Qt.size(5, 5)
    }

    Transform {
        id: groundTransform
//        Translate {
//            dy: -7
//        }

        translation: Qt.vector3d(0, -7, 0);

    }

    components: [
        groundMesh,
        groundTransform,
        material
    ]
}
