%YAML 1.1
%TAG !u! tag:unity3d.com,2011:
--- !u!114 &1
MonoBehaviour:
  m_ObjectHideFlags: 52
  m_CorrespondingSourceObject: {fileID: 0}
  m_PrefabInstance: {fileID: 0}
  m_PrefabAsset: {fileID: 0}
  m_GameObject: {fileID: 0}
  m_Enabled: 1
  m_EditorHideFlags: 1
  m_Script: {fileID: 12004, guid: 0000000000000000e000000000000000, type: 0}
  m_Name: 
  m_EditorClassIdentifier: 
  m_PixelRect:
    serializedVersion: 2
    x: 0
    y: 37
    width: 1512
    height: 945
  m_ShowMode: 4
  m_Title: Muse Chat
  m_RootView: {fileID: 4}
  m_MinSize: {x: 875, y: 300}
  m_MaxSize: {x: 10000, y: 10000}
  m_Maximized: 0
--- !u!114 &2
MonoBehaviour:
  m_ObjectHideFlags: 52
  m_CorrespondingSourceObject: {fileID: 0}
  m_PrefabInstance: {fileID: 0}
  m_PrefabAsset: {fileID: 0}
  m_GameObject: {fileID: 0}
  m_Enabled: 1
  m_EditorHideFlags: 0
  m_Script: {fileID: 12006, guid: 0000000000000000e000000000000000, type: 0}
  m_Name: ConsoleWindow
  m_EditorClassIdentifier: 
  m_Children: []
  m_Position:
    serializedVersion: 2
    x: 0
    y: 0
    width: 1512
    height: 895
  m_MinSize: {x: 100, y: 100}
  m_MaxSize: {x: 4000, y: 4000}
  m_ActualView: {fileID: 7}
  m_Panes:
  - {fileID: 7}
  m_Selected: 0
  m_LastSelected: 0
--- !u!114 &3
MonoBehaviour:
  m_ObjectHideFlags: 52
  m_CorrespondingSourceObject: {fileID: 0}
  m_PrefabInstance: {fileID: 0}
  m_PrefabAsset: {fileID: 0}
  m_GameObject: {fileID: 0}
  m_Enabled: 1
  m_EditorHideFlags: 1
  m_Script: {fileID: 12010, guid: 0000000000000000e000000000000000, type: 0}
  m_Name: 
  m_EditorClassIdentifier: 
  m_Children:
  - {fileID: 2}
  m_Position:
    serializedVersion: 2
    x: 0
    y: 30
    width: 1512
    height: 895
  m_MinSize: {x: 100, y: 50}
  m_MaxSize: {x: 8096, y: 8096}
  vertical: 0
  controlID: 44
  draggingID: 0
--- !u!114 &4
MonoBehaviour:
  m_ObjectHideFlags: 52
  m_CorrespondingSourceObject: {fileID: 0}
  m_PrefabInstance: {fileID: 0}
  m_PrefabAsset: {fileID: 0}
  m_GameObject: {fileID: 0}
  m_Enabled: 1
  m_EditorHideFlags: 1
  m_Script: {fileID: 12008, guid: 0000000000000000e000000000000000, type: 0}
  m_Name: 
  m_EditorClassIdentifier: 
  m_Children:
  - {fileID: 5}
  - {fileID: 3}
  - {fileID: 6}
  m_Position:
    serializedVersion: 2
    x: 0
    y: 0
    width: 1512
    height: 945
  m_MinSize: {x: 875, y: 300}
  m_MaxSize: {x: 10000, y: 10000}
  m_UseTopView: 1
  m_TopViewHeight: 30
  m_UseBottomView: 1
  m_BottomViewHeight: 20
--- !u!114 &5
MonoBehaviour:
  m_ObjectHideFlags: 52
  m_CorrespondingSourceObject: {fileID: 0}
  m_PrefabInstance: {fileID: 0}
  m_PrefabAsset: {fileID: 0}
  m_GameObject: {fileID: 0}
  m_Enabled: 1
  m_EditorHideFlags: 1
  m_Script: {fileID: 12011, guid: 0000000000000000e000000000000000, type: 0}
  m_Name: 
  m_EditorClassIdentifier: 
  m_Children: []
  m_Position:
    serializedVersion: 2
    x: 0
    y: 0
    width: 1512
    height: 30
  m_MinSize: {x: 0, y: 0}
  m_MaxSize: {x: 0, y: 0}
  m_LastLoadedLayoutName: 
--- !u!114 &6
MonoBehaviour:
  m_ObjectHideFlags: 52
  m_CorrespondingSourceObject: {fileID: 0}
  m_PrefabInstance: {fileID: 0}
  m_PrefabAsset: {fileID: 0}
  m_GameObject: {fileID: 0}
  m_Enabled: 1
  m_EditorHideFlags: 1
  m_Script: {fileID: 12042, guid: 0000000000000000e000000000000000, type: 0}
  m_Name: 
  m_EditorClassIdentifier: 
  m_Children: []
  m_Position:
    serializedVersion: 2
    x: 0
    y: 925
    width: 1512
    height: 20
  m_MinSize: {x: 0, y: 0}
  m_MaxSize: {x: 0, y: 0}
--- !u!114 &7
MonoBehaviour:
  m_ObjectHideFlags: 52
  m_CorrespondingSourceObject: {fileID: 0}
  m_PrefabInstance: {fileID: 0}
  m_PrefabAsset: {fileID: 0}
  m_GameObject: {fileID: 0}
  m_Enabled: 1
  m_EditorHideFlags: 1
  m_Script: {fileID: 12003, guid: 0000000000000000e000000000000000, type: 0}
  m_Name: 
  m_EditorClassIdentifier: 
  m_MinSize: {x: 100, y: 100}
  m_MaxSize: {x: 4000, y: 4000}
  m_TitleContent:
    m_Text: Console
    m_Image: {fileID: -4950941429401207979, guid: 0000000000000000d000000000000000, type: 0}
    m_Tooltip: 
  m_Pos:
    serializedVersion: 2
    x: 0
    y: 67
    width: 1512
    height: 874
  m_SerializedDataModeController:
    m_DataMode: 0
    m_PreferredDataMode: 0
    m_SupportedDataModes: 
    isAutomatic: 1
  m_ViewDataDictionary: {fileID: 0}
  m_OverlayCanvas:
    m_LastAppliedPresetName: Default
    m_SaveData: []
    m_OverlaysVisible: 1
