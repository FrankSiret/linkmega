import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import cpp 1.0

ApplicationWindow {
    id: window
    visible: true

    width: 750

    minimumWidth: 600
    maximumWidth: 1200

    minimumHeight: 257
    maximumHeight: 257

    title: qsTr("hack-life animeflv")

    color: "transparent"

    background: Rectangle {
        radius: 4
        color: "#303030"
        border.color: Qt.darker("#303030")
        border.width: 2
    }

    flags: Qt.MSWindowsFixedSizeDialogHint | Qt.FramelessWindowHint

    Cpp {
        id: cpp
        onText: {
            name.text = texto
        }
    }

    MouseArea {
        anchors.fill: parent
        property point lastMousePos: Qt.point(0, 0)
        property bool mousePressed: false
        onPressed: {
            lastMousePos = Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: {
            var delta = Qt.point(mouse.x - lastMousePos.x,
                                 mouse.y - lastMousePos.y)
            window.x += delta.x
            window.y += delta.y
        }
    }

    Rectangle {
        width: 12
        height: 12
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 2
        color: Qt.rgba(0,0,0,0)
        Image {
            anchors.centerIn: parent
            width: 11
            fillMode: Image.PreserveAspectFit
            source: "qrc:/res/resize.svg"
            opacity: .3
        }
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.SizeHorCursor
            property point lastMousePos: Qt.point(0, 0)
            property bool mousePressed: false

            onPressed: {
                lastMousePos = Qt.point(mouse.x, mouse.y)
            }
            onPositionChanged: {
                var delta = Qt.point(mouse.x - lastMousePos.x,
                                     mouse.y - lastMousePos.y)

                window.width = Math.max(Math.min(window.width + delta.x, maximumWidth), minimumWidth)
                window.height = Math.max(Math.min(window.height + delta.y, maximumHeight), minimumHeight)
            }
        }
    }

    RowLayout {
        id: layoutTitle
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20

        Label {
            id: labelTitle
            text: "hack-life animeflv"
            font.bold: true
            font.pointSize: 14
            Layout.rightMargin: 10
        }

        /*Rectangle {
            id: buttonAdd
            width: 30
            height: 30
            color: "transparent"

            property color rectColor: "#606060"
            Rectangle {
                width: 17
                height: 3
                color: parent.rectColor
                anchors.centerIn: parent
            }
            Rectangle {
                width: 17
                height: 3
                color: parent.rectColor
                rotation: 90
                anchors.centerIn: parent
            }

            property bool hover: false
            property bool press: false

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.hover = true; parent.rectColor = parent.press ? "#aaa" : "#fff" }
                onExited: { parent.hover = false; parent.rectColor = "#606060" }
                onPressed: { parent.press = true; parent.rectColor = "#aaa" }
                onReleased: { parent.press = false; parent.rectColor = parent.hover ? "#fff" : "#606060" }
            }
        }*/

        Rectangle {
            id: buttonSetting
            width: 30
            height: 30
            color: "transparent"

            property var sources: ["qrc:/res/settings1.svg", "qrc:/res/settings2.svg", "qrc:/res/settings3.svg"]
            property string rectSource: sources[0]

            Image {
                id: img1
                source: parent.rectSource
                anchors.centerIn: parent
                sourceSize.width: 17
                fillMode: Image.PreserveAspectFit
            }

            property bool hover: false
            property bool press: false

            /*MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: { parent.hover = true; parent.rectSource = parent.press ? parent.sources[2] : parent.sources[1] }
                onExited: { parent.hover = false; parent.rectSource = parent.sources[0] }
                onPressed: { parent.press = true; parent.rectSource = parent.sources[2] }
                onReleased: { parent.press = false; parent.rectSource = parent.hover ? parent.sources[1] : parent.sources[0] }
            }*/
            ToolTip {
                text: "Config"
                delay: 500
                timeout: 2000
                visible: parent.hover
            }
        }

        Rectangle {
            id: buttonHelp
            width: 30
            height: 30
            color: "transparent"

            property color rectColor: "#606060"
            Label {
                text: "?"
                font.bold: true
                font.pointSize: 16
                color: parent.rectColor
                anchors.centerIn: parent
            }

            property bool hover: false
            property bool press: false

            /*MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: { parent.hover = true; parent.rectColor = parent.press ? "#aaa" : "#fff" }
                onExited: { parent.hover = false; parent.rectColor = "#606060" }
                onPressed: { parent.press = true; parent.rectColor = "#aaa" }
                onReleased: { parent.press = false; parent.rectColor = parent.hover ? "#fff" : "#606060" }
            }*/
            ToolTip {
                text: "Help"
                delay: 500
                timeout: 2000
                visible: parent.hover
            }
        }

        Item {
            width: 1
            Layout.fillWidth: true
        }

        Label {
            text: "frank.siret@gmail.com"
            font.pointSize: 9
            color: "#ce93d8"
            property bool hover: false
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    Qt.openUrlExternally("mailto:frank.siret@gmail.com")
                }
                onHoveredChanged: {
                    parent.font.underline = parent.hover = !parent.hover
                }
            }
            ToolTip {
                text: "Frank Rodríguez Siret"
                delay: 500
                timeout: 2000
                visible: parent.hover
            }
        }

        Rectangle {
            id: buttonClose
            width: 30
            height: 30
            color: "transparent"

            property color rectColor: "#606060"
            Rectangle {
                width: 20
                height: 3
                color: parent.rectColor
                rotation: 45
                anchors.centerIn: parent
            }
            Rectangle {
                width: 20
                height: 3
                color: parent.rectColor
                rotation: -45
                anchors.centerIn: parent
            }

            property bool hover: false
            property bool press: false

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: { parent.hover = true; parent.rectColor = parent.press ? "#aaa" : "#fff" }
                onExited: { parent.hover = false; parent.rectColor = "#606060" }
                onPressed: { parent.press = true; parent.rectColor = "#aaa" }
                onReleased: { parent.press = false; parent.rectColor = parent.hover ? "#fff" : "#606060" }
                onClicked: Qt.quit()
            }
        }
    }

    GridLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: layoutTitle.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 20
        anchors.bottomMargin: 14
        columns: 2
        columnSpacing: 25
        rowSpacing: 0

        Label {
            text: "Hack redirection and shortening URL links from AnimeFLV"
            Layout.columnSpan: 2
            font.pointSize: 13
        }
        Item {
            height: 10
            Layout.columnSpan: 2
        }
        TextField {
            id: name
            text: ""
            placeholderText: "Paste the download link here"
            selectByMouse: true
            onTextChanged: {
                var s = cpp.analize(text)
                text2.text = unescape(s)
            }
            Layout.fillWidth: true
        }
        Button {
            id: paste
            text: "Paste link"
            onClicked: { cpp.paste() }

            Layout.minimumWidth: 100
        }

        TextField {
            id: text2
            text: ""
            selectByMouse: true
            Layout.fillWidth: true
        }

        Button {
            id: copy
            text: "Copy link"
            onClicked: { cpp.copy(text2.text) }
            Layout.minimumWidth: 100
        }
        RowLayout {
            /*GridLayout {
                rowSpacing: 0
                columnSpacing: 10
                columns: 2
                Label {
                    text: "About:"
                }
                Label {
                    text: "Frank Rodríguez Siret"
                    Layout.fillWidth: true
                }
                Item {
                    height: 1
                }
                Label {
                    text: "frank.siret@gmail.com"
                    color: "#ce93d8"
                    property bool hover: false
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            Qt.openUrlExternally("mailto:frank.siret@gmail.com")
                        }
                        onHoveredChanged: {
                            parent.font.underline = parent.hover = !parent.hover
                        }
                    }
                }
            }*/
            Item {
                width: 1
                Layout.fillWidth: true
            }

            Switch {
                id: alwaysLink
                text: "Always open link"
            }
        }

        Button {
            id: open
            text: "Open link"
            onClicked: Qt.openUrlExternally(text2.text)
            Layout.minimumWidth: 100
            flat: true
            highlighted: true
        }
    }

    Rectangle {
        id: message
        visible: false
        anchors.centerIn: parent
        width: 300
        height: 80
        color: "#e8222222"
        radius: 4
        Label {
            anchors.centerIn: parent
            text: "The text has been copied"
            font.pointSize: 12
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                message.visible = false
            }
        }
    }

    Timer {
        id: timer
        interval: 2500
        running: false
        onTriggered: {
            message.visible = false
            stop()
        }
    }

    onActiveChanged: {
        if(active) {
            var s = cpp.getClipboard()
            var b = cpp.test( unescape(s) )
            if( b ) {
                paste.clicked()
                copy.clicked()
                if(alwaysLink.checked)
                    open.clicked()
                else {
                    message.visible = true
                    timer.start()
                }
            }
        }
    }

}

// http://ouo.io/s/y0d65LCP?s=https%3A%2F%2Fwww52.zippyshare.com%2Fv%2FG6Fdhqsu%2Ffile.html
// http://ouo.io/s/y0d65LCP?s=https%3A%2F%2Fmega.nz%2F%23%21HtlgBQhT%21dmiPFP-TNzZug31NPAeDALf3mn0-E6dC_MGWWk34lxM
