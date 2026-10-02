import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    id: configAppearance

    property alias cfg_use24HourFormat: use24HourCheckbox.checked
    property alias cfg_themeMode: themeModeCombo.currentIndex
    property alias cfg_useSystemAccent: useSystemAccentCheckbox.checked

    ColumnLayout {
        spacing: 10

        RowLayout {
            CheckBox {
                id: use24HourCheckbox
                text: i18n("Use 24-Hour Format")
            }
        }

        Label {
            text: i18n("Show time in 24-hour format (e.g., 14:30) instead of 12-hour format (e.g., 2:30)")
            font.pointSize: 9
            opacity: 0.7
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#333333"
            opacity: 0.3
        }

        RowLayout {
            Label {
                text: i18n("Theme:")
                Layout.alignment: Qt.AlignLeft
            }

            ComboBox {
                id: themeModeCombo
                model: [i18n("Dark"), i18n("Light"), i18n("Follow System")]
                Layout.fillWidth: true
            }
        }

        Label {
            text: i18n("Dark: Nothing's signature dark aesthetic. Light: Nothing's light palette. Follow System: Matches your KDE dark/light scheme.")
            font.pointSize: 9
            opacity: 0.7
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        RowLayout {
            CheckBox {
                id: useSystemAccentCheckbox
                text: i18n("Use system accent color")
            }
        }

        Label {
            text: i18n("Replace Nothing's red accent with your KDE system highlight color while keeping the Nothing aesthetic.")
            font.pointSize: 9
            opacity: 0.7
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
