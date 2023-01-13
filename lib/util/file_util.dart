import 'package:file_selector/file_selector.dart';

const XTypeGroup videoGroup = XTypeGroup(label: 'Videos', extensions: <String>[
  '3gp',
  'avi',
  'asf',
  'asx',
  'dat',
  'flv',
  'f4v',
  'rm',
  'rmvb',
  'mp4',
  'mpe',
  'mpeg',
  'mpg',
  'mov',
  'm4v',
  'mkv',
  'vob',
  'wmv',
  'ios'
]);
const XTypeGroup allGroup = XTypeGroup(label: '全部');

// class FileUtil {
//   const FileUtil._();
//
//   // 静态私有成员，没有初始化
//   static FileUtil? _instance;
//
//   static FileUtil get instance => _fileInstance();
//
//   static FileUtil _fileInstance() => _instance ??= const FileUtil._();
//
//   Future<XFile?> singleFile({
//     List<XTypeGroup> acceptedTypeGroups = const <XTypeGroup>[],
//     String? initialDirectory,
//     String? confirmButtonText,
//   }) {
//     return openFile(
//         acceptedTypeGroups: acceptedTypeGroups,
//         initialDirectory: initialDirectory,
//         confirmButtonText: confirmButtonText);
//   }
//
//   Future<List<XFile>> multipleFile({
//     List<XTypeGroup> acceptedTypeGroups = const <XTypeGroup>[],
//     String? initialDirectory,
//     String? confirmButtonText,
//   }) {
//     return openFiles(
//         acceptedTypeGroups: acceptedTypeGroups,
//         initialDirectory: initialDirectory,
//         confirmButtonText: confirmButtonText);
//   }
// }
