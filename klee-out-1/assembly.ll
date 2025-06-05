; ModuleID = 'triangle.bc'
source_filename = "triangle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"equilateral triangle.\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"isosceles triangle.\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"triangle.\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"non-triangle.\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @triangle(i32 %a, i32 %b, i32 %c) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %a.addr, align 4, !dbg !19
  %1 = load i32, i32* %b.addr, align 4, !dbg !21
  %add = add nsw i32 %0, %1, !dbg !22
  %2 = load i32, i32* %c.addr, align 4, !dbg !23
  %cmp = icmp sgt i32 %add, %2, !dbg !24
  br i1 %cmp, label %land.lhs.true, label %if.else19, !dbg !25

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !26
  %4 = load i32, i32* %c.addr, align 4, !dbg !27
  %add1 = add nsw i32 %3, %4, !dbg !28
  %5 = load i32, i32* %b.addr, align 4, !dbg !29
  %cmp2 = icmp sgt i32 %add1, %5, !dbg !30
  br i1 %cmp2, label %land.lhs.true3, label %if.else19, !dbg !31

land.lhs.true3:                                   ; preds = %land.lhs.true
  %6 = load i32, i32* %b.addr, align 4, !dbg !32
  %7 = load i32, i32* %c.addr, align 4, !dbg !33
  %add4 = add nsw i32 %6, %7, !dbg !34
  %8 = load i32, i32* %a.addr, align 4, !dbg !35
  %cmp5 = icmp sgt i32 %add4, %8, !dbg !36
  br i1 %cmp5, label %if.then, label %if.else19, !dbg !37

if.then:                                          ; preds = %land.lhs.true3
  %9 = load i32, i32* %a.addr, align 4, !dbg !38
  %10 = load i32, i32* %b.addr, align 4, !dbg !41
  %cmp6 = icmp eq i32 %9, %10, !dbg !42
  br i1 %cmp6, label %if.then10, label %lor.lhs.false, !dbg !43

lor.lhs.false:                                    ; preds = %if.then
  %11 = load i32, i32* %a.addr, align 4, !dbg !44
  %12 = load i32, i32* %c.addr, align 4, !dbg !45
  %cmp7 = icmp eq i32 %11, %12, !dbg !46
  br i1 %cmp7, label %if.then10, label %lor.lhs.false8, !dbg !47

lor.lhs.false8:                                   ; preds = %lor.lhs.false
  %13 = load i32, i32* %b.addr, align 4, !dbg !48
  %14 = load i32, i32* %c.addr, align 4, !dbg !49
  %cmp9 = icmp eq i32 %13, %14, !dbg !50
  br i1 %cmp9, label %if.then10, label %if.else16, !dbg !51

if.then10:                                        ; preds = %lor.lhs.false8, %lor.lhs.false, %if.then
  %15 = load i32, i32* %a.addr, align 4, !dbg !52
  %16 = load i32, i32* %b.addr, align 4, !dbg !55
  %cmp11 = icmp eq i32 %15, %16, !dbg !56
  br i1 %cmp11, label %land.lhs.true12, label %if.else, !dbg !57

land.lhs.true12:                                  ; preds = %if.then10
  %17 = load i32, i32* %a.addr, align 4, !dbg !58
  %18 = load i32, i32* %c.addr, align 4, !dbg !59
  %cmp13 = icmp eq i32 %17, %18, !dbg !60
  br i1 %cmp13, label %if.then14, label %if.else, !dbg !61

if.then14:                                        ; preds = %land.lhs.true12
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0)), !dbg !62
  br label %if.end, !dbg !64

if.else:                                          ; preds = %land.lhs.true12, %if.then10
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then14
  br label %if.end18, !dbg !67

if.else16:                                        ; preds = %lor.lhs.false8
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.end
  br label %if.end21, !dbg !70

if.else19:                                        ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  br label %if.end21

if.end21:                                         ; preds = %if.else19, %if.end18
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %b, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %c, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = bitcast i32* %a to i8*, !dbg !83
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  %1 = bitcast i32* %b to i8*, !dbg !85
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  %2 = bitcast i32* %c to i8*, !dbg !87
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)), !dbg !88
  %3 = load i32, i32* %a, align 4, !dbg !89
  %4 = load i32, i32* %b, align 4, !dbg !90
  %5 = load i32, i32* %c, align 4, !dbg !91
  call void @triangle(i32 %3, i32 %4, i32 %5), !dbg !92
  ret i32 0, !dbg !93
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "triangle.c", directory: "/home/klee/klee-triangle")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!9 = distinct !DISubprogram(name: "triangle", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!14 = !DILocation(line: 4, column: 19, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 4, type: !12)
!16 = !DILocation(line: 4, column: 26, scope: !9)
!17 = !DILocalVariable(name: "c", arg: 3, scope: !9, file: !1, line: 4, type: !12)
!18 = !DILocation(line: 4, column: 33, scope: !9)
!19 = !DILocation(line: 5, column: 10, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !1, line: 5, column: 9)
!21 = !DILocation(line: 5, column: 14, scope: !20)
!22 = !DILocation(line: 5, column: 12, scope: !20)
!23 = !DILocation(line: 5, column: 18, scope: !20)
!24 = !DILocation(line: 5, column: 16, scope: !20)
!25 = !DILocation(line: 5, column: 21, scope: !20)
!26 = !DILocation(line: 5, column: 25, scope: !20)
!27 = !DILocation(line: 5, column: 29, scope: !20)
!28 = !DILocation(line: 5, column: 27, scope: !20)
!29 = !DILocation(line: 5, column: 33, scope: !20)
!30 = !DILocation(line: 5, column: 31, scope: !20)
!31 = !DILocation(line: 5, column: 36, scope: !20)
!32 = !DILocation(line: 5, column: 40, scope: !20)
!33 = !DILocation(line: 5, column: 44, scope: !20)
!34 = !DILocation(line: 5, column: 42, scope: !20)
!35 = !DILocation(line: 5, column: 48, scope: !20)
!36 = !DILocation(line: 5, column: 46, scope: !20)
!37 = !DILocation(line: 5, column: 9, scope: !9)
!38 = !DILocation(line: 6, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 6, column: 13)
!40 = distinct !DILexicalBlock(scope: !20, file: !1, line: 5, column: 52)
!41 = !DILocation(line: 6, column: 18, scope: !39)
!42 = !DILocation(line: 6, column: 15, scope: !39)
!43 = !DILocation(line: 6, column: 20, scope: !39)
!44 = !DILocation(line: 6, column: 23, scope: !39)
!45 = !DILocation(line: 6, column: 28, scope: !39)
!46 = !DILocation(line: 6, column: 25, scope: !39)
!47 = !DILocation(line: 6, column: 30, scope: !39)
!48 = !DILocation(line: 6, column: 33, scope: !39)
!49 = !DILocation(line: 6, column: 38, scope: !39)
!50 = !DILocation(line: 6, column: 35, scope: !39)
!51 = !DILocation(line: 6, column: 13, scope: !40)
!52 = !DILocation(line: 7, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 7, column: 17)
!54 = distinct !DILexicalBlock(scope: !39, file: !1, line: 6, column: 41)
!55 = !DILocation(line: 7, column: 22, scope: !53)
!56 = !DILocation(line: 7, column: 19, scope: !53)
!57 = !DILocation(line: 7, column: 24, scope: !53)
!58 = !DILocation(line: 7, column: 27, scope: !53)
!59 = !DILocation(line: 7, column: 32, scope: !53)
!60 = !DILocation(line: 7, column: 29, scope: !53)
!61 = !DILocation(line: 7, column: 17, scope: !54)
!62 = !DILocation(line: 8, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !53, file: !1, line: 7, column: 35)
!64 = !DILocation(line: 9, column: 13, scope: !63)
!65 = !DILocation(line: 10, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !53, file: !1, line: 9, column: 20)
!67 = !DILocation(line: 12, column: 9, scope: !54)
!68 = !DILocation(line: 13, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !39, file: !1, line: 12, column: 16)
!70 = !DILocation(line: 15, column: 5, scope: !40)
!71 = !DILocation(line: 16, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !20, file: !1, line: 15, column: 12)
!73 = !DILocation(line: 18, column: 1, scope: !9)
!74 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 20, type: !75, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!12}
!77 = !DILocalVariable(name: "a", scope: !74, file: !1, line: 21, type: !12)
!78 = !DILocation(line: 21, column: 9, scope: !74)
!79 = !DILocalVariable(name: "b", scope: !74, file: !1, line: 21, type: !12)
!80 = !DILocation(line: 21, column: 12, scope: !74)
!81 = !DILocalVariable(name: "c", scope: !74, file: !1, line: 21, type: !12)
!82 = !DILocation(line: 21, column: 15, scope: !74)
!83 = !DILocation(line: 22, column: 24, scope: !74)
!84 = !DILocation(line: 22, column: 5, scope: !74)
!85 = !DILocation(line: 23, column: 24, scope: !74)
!86 = !DILocation(line: 23, column: 5, scope: !74)
!87 = !DILocation(line: 24, column: 24, scope: !74)
!88 = !DILocation(line: 24, column: 5, scope: !74)
!89 = !DILocation(line: 25, column: 14, scope: !74)
!90 = !DILocation(line: 25, column: 17, scope: !74)
!91 = !DILocation(line: 25, column: 20, scope: !74)
!92 = !DILocation(line: 25, column: 5, scope: !74)
!93 = !DILocation(line: 26, column: 5, scope: !74)
