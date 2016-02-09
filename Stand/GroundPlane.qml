import Qt3D 2.0
import Qt3D.Renderer 2.0

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
        Translate {
            dy: -7
        }
    }

    components: [
        groundMesh,
        groundTransform,
        material
    ]
}
