import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import "components"

PlasmoidItem {
    id: root

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    NothingColors {
        id: nColors
        themeMode: plasmoid.configuration.themeMode
        useSystemAccent: plasmoid.configuration.useSystemAccent
    }

    preferredRepresentation: fullRepresentation

    property bool use24HourFormat: plasmoid.configuration.use24HourFormat

    property string currentHours: ""
    property string currentMinutes: ""
    property string currentDay: ""
    property string currentDate: ""

    FontLoader {
        id: ndotFont
        source: Qt.resolvedUrl("../fonts/ndot.ttf")
    }

    FontLoader {
        id: ndot55Font
        source: Qt.resolvedUrl("../fonts/ndot-55.otf")
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateDateTime()
        Component.onCompleted: updateDateTime()
    }

    function updateDateTime() {
        var now = new Date()
        
        var hours = now.getHours()
        if (!root.use24HourFormat) {
            hours = hours % 12
            if (hours === 0) hours = 12
        }
        
        var minutes = now.getMinutes()
        
        root.currentHours = hours < 10 ? "0" + hours : hours.toString()
        root.currentMinutes = minutes < 10 ? "0" + minutes : minutes.toString()
        
        var dayNames = ["SUN,", "MON,", "TUE,", "WED,", "THU,", "FRI,", "SAT,"]
        root.currentDay = dayNames[now.getDay()]
        
        root.currentDate = Qt.formatDate(now, "dd MMM").toUpperCase()
    }

    compactRepresentation: Item {
        PlasmaComponents.Label {
            anchors.centerIn: parent
            text: root.currentHours + ":" + root.currentMinutes
            font.pixelSize: parent.height * 0.4
            font.bold: true
        }
    }

    fullRepresentation: Item {
        Layout.preferredWidth: 200
        Layout.preferredHeight: 300
        Layout.minimumWidth: 150
        Layout.minimumHeight: 200

        Column {
            anchors.centerIn: parent
            spacing: 8

            // Hours
            Text {
                text: root.currentHours
                font.family: ndotFont.name
                font.pixelSize: Math.min(parent.parent.width * 0.4, parent.parent.height * 0.25)
                color: nColors.textPrimary
                opacity: 0.95
            }

            // Minutes
            Text {
                text: root.currentMinutes
                font.family: ndotFont.name
                font.pixelSize: Math.min(parent.parent.width * 0.4, parent.parent.height * 0.25)
                color: nColors.textPrimary
                opacity: 0.95
            }

            // Day
            Text {
                text: root.currentDay
                font.family: ndot55Font.name
                font.pixelSize: Math.min(parent.parent.width * 0.2, parent.parent.height * 0.12)
                color: nColors.textPrimary
                opacity: 0.8
            }

            // Date
            Text {
                text: root.currentDate
                font.family: ndot55Font.name
                font.pixelSize: Math.min(parent.parent.width * 0.2, parent.parent.height * 0.12)
                color: nColors.textPrimary
                opacity: 0.8
            }
        }
    }
}
