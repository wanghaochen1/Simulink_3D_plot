# Simulink 中的 三维绘图 Matlab Function 
## 因为simulink没有现成的三维绘图功能，特意写一个

- 使用了plot3作为主要绘图函数（也可以修改成scatter3来实现功能）
- 通过数据聚合的方法避免数组越界（Simulink中的数组大小不能修改，必须在初始化的时候设定好，所以当仿真时间比较长的时候会出现数组越界）

## level-2 S-Function的三维绘图功能

- Simulink支持 S-function来使用Matlab语法（C、C++或Fortran也可以）编写自定义模型，可以对数组的大小进行修改
