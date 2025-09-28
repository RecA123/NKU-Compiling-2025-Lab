@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(ptr noundef, ...) #1

;定义函数max
define dso_local i32 @max(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %11

9:                                                
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %3, align 4
  br label %13

11:                                             
  %12 = load i32, ptr %5, align 4
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

; 定义函数factorial
define dso_local i32 @factorial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sle i32 %4, 1
  br i1 %5, label %6, label %7

6:                                          
  store i32 1, ptr %2, align 4
  br label %13

7:                                            
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = sub nsw i32 %9, 1
  %11 = call i32 @factorial(i32 noundef %10)
  %12 = mul nsw i32 %8, %11
  store i32 %12, ptr %2, align 4
  br label %13

13:                                           
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

;定义主函数
define dso_local i32 @main() #0 {
  ;定义临时变量
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [5 x i32], align 16
  ;变量赋值初始化
  store i32 0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 5, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 5, ptr %6, align 4
  
  ; 执行result = a + b
  %8 = load i32, ptr %2, align 4
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %4, align 4
  
  ; 执行result = a - b
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %3, align 4
  %13 = sub nsw i32 %11, %12
  store i32 %13, ptr %4, align 4
  
  ; 执行result = a * b
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = mul nsw i32 %14, %15
  store i32 %16, ptr %4, align 4
  
  ; 执行printf("%d\n", result)
  %17 = load i32, ptr %4, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %17)
  
  ; 执行result = a / b
  %19 = load i32, ptr %2, align 4
  %20 = load i32, ptr %3, align 4
  %21 = sdiv i32 %19, %20
  store i32 %21, ptr %4, align 4
  
  ; 执行result = a % b
  %22 = load i32, ptr %2, align 4
  %23 = load i32, ptr %3, align 4
  %24 = srem i32 %22, %23
  store i32 %24, ptr %4, align 4
  
  ; 执行result = a
  %25 = load i32, ptr %2, align 4
  store i32 %25, ptr %4, align 4
  
  ; 执行result = result + 1
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  
  ; 执行result = result * 2
  %28 = load i32, ptr %4, align 4
  %29 = mul nsw i32 %28, 2
  store i32 %29, ptr %4, align 4
  
  ; 执行printf("%d\n", result)
  %30 = load i32, ptr %4, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %30)
  
  ; 实现分支判断if (a > b)
  %32 = load i32, ptr %2, align 4
  %33 = load i32, ptr %3, align 4
  %34 = icmp sgt i32 %32, %33
  br i1 %34, label %35, label %36

35:                                               
  store i32 1, ptr %4, align 4
  br label %37

36:                                               
  store i32 0, ptr %4, align 4
  br label %37

37:                                               
  ; 执行分支判断if (a > 0 && b > 0)
  %38 = load i32, ptr %2, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %44

40:                                               
  %41 = load i32, ptr %3, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %44

43:                                               
  store i32 1, ptr %4, align 4
  br label %44

44:                                              
  ; 执行分支判断if (a > 0 || b > 0)
  %45 = load i32, ptr %2, align 4
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %50, label %47

47:
  %48 = load i32, ptr %3, align 4
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %51

50:
  store i32 1, ptr %4, align 4
  br label %51

51:
  ; 执行多重分支判断if (a > b) ... else if (a < b) ... else ...
  %52 = load i32, ptr %2, align 4
  %53 = load i32, ptr %3, align 4
  %54 = icmp sgt i32 %52, %53
  br i1 %54, label %55, label %59

55:
  %56 = load i32, ptr %2, align 4
  %57 = load i32, ptr %3, align 4
  %58 = call i32 @max(i32 noundef %56, i32 noundef %57)
  store i32 %58, ptr %4, align 4
  br label %67

59:
  %60 = load i32, ptr %2, align 4
  %61 = load i32, ptr %3, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %65

63:
  %64 = load i32, ptr %3, align 4
  store i32 %64, ptr %4, align 4
  br label %66

65:
  store i32 0, ptr %4, align 4
  br label %66

66: 
  br label %67

67:
  ; 执行printf("%d\n", result)
  %68 = load i32, ptr %4, align 4
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %68)
  
  ; 执行赋值语句i = 0和result = 0
  store i32 0, ptr %5, align 4
  store i32 0, ptr %4, align 4
  br label %70

70:
  ; 实现循环while (i <= 10)
  %71 = load i32, ptr %5, align 4
  %72 = icmp sle i32 %71, 10
  br i1 %72, label %73, label %80

73:
  ; 执行result和i的自增
  %74 = load i32, ptr %4, align 4
  %75 = load i32, ptr %5, align 4
  %76 = add nsw i32 %74, %75
  store i32 %76, ptr %4, align 4
  %77 = load i32, ptr %5, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %5, align 4
  br label %70, !llvm.loop !6

79:
  br label %80

80:                                               
  store i32 0, ptr %4, align 4
  ; 实现循环for (i = 0; i < 10; i = i + 1)
  store i32 0, ptr %5, align 4
  br label %81

81:                                          
  %82 = load i32, ptr %5, align 4
  %83 = icmp slt i32 %82, 10
  br i1 %83, label %84, label %106

84:
  ;实现分支if (i % 2 == 0)                                   
  %85 = load i32, ptr %5, align 4
  %86 = srem i32 %85, 2
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %89

88:                                              
  br label %100

89:                                            
  ; 执行result = result + i
  %90 = load i32, ptr %4, align 4
  %91 = load i32, ptr %5, align 4
  %92 = add nsw i32 %90, %91
  store i32 %92, ptr %4, align 4
  ; 实现分支if (result > 20) break
  %93 = load i32, ptr %4, align 4
  %94 = icmp sgt i32 %93, 20
  br i1 %94, label %95, label %96

95:                                               
  br label %106

96:                                               
  br label %97

97:                                               
  br label %98

98:                                              
  br label %99

99:                                               
  br label %100

100:                                           
  ; 实现i自增
  %101 = load i32, ptr %5, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %5, align 4
  br label %81, !llvm.loop !8

103:                                              
  br label %81

104:                                              
  br label %105

105:                                             
  br label %106

106:                                             
  ; 函数调用 factorial(n)
  %107 = load i32, ptr %6, align 4
  %108 = call i32 @factorial(i32 noundef %107)
  store i32 %108, ptr %4, align 4
  %109 = load i32, ptr %4, align 4
  %110 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %109)
  
  ; 实现数组赋值int arr[5] = {1, 2, 3, 4, 5};
  %111 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 0
  store i32 1, ptr %111, align 16
  %112 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 1
  store i32 2, ptr %112, align 4
  %113 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 2
  store i32 3, ptr %113, align 8
  %114 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 3
  store i32 4, ptr %114, align 4
  %115 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 4
  store i32 5, ptr %115, align 16
  
  ; 实现数组元素赋值arr[0] = 10
  %116 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 0
  store i32 10, ptr %116, align 16
  
  %117 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 0
  %118 = load i32, ptr %117, align 16
  %119 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 1
  %120 = load i32, ptr %119, align 4
  %121 = add nsw i32 %118, %120
  store i32 %121, ptr %4, align 4
  
  %122 = load i32, ptr %4, align 4
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %122)
  
  ret i32 0
}

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}