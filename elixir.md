# elixir

### 利用数据转换去编程

```shell
ps -ef | wc -l
```

##  模式匹配

### = 就是 代数里的等号



```elixir
> a = 1
> a + 2
> a
> 1 = a
> 2 = a
** MatchError no match of right hand side value: 1
```

- 左边是一个变量，右边是一个整数字面量，变量a被绑定到值1，elixir使得匹配为真。Elixir只会改变等号左边的变量值，而右边的变量会被替换成其所对应的值。

### 更复杂的匹配

```elixir
[a, b, a] = [1, 2, 1]
[a | _tail] = [1, 2, 1]
^a = 1 #直接进行匹配操作, a的地址被钉住了
```

# 编程就是数据转换

## 用不可变数据编写程序

```elixir
name = "elixir"
cap_name = String.capitalize name
cap_name
>"Elixir"
name
> "elixir"
```

# Elixir 基础

- 5 种值类型
  - 任意大小的整数
  - 浮点数
  - 原子 (标记值)
  - 区间 开始..结束，想遍历区间中的值，两端必须是整数
  - 正则表达式 ~r{regexp}opts

- 2 种系统类型
  - PID 和 端口 self() PID是本地或者远端进程的引用，而端口是读写资源的引用， 可以通过self()获得当前进程PID
  - 引用  make_ref 创建全局唯一的引用，任何其他引用都不会与之相等

- 4 种收集类型 （收集： 可以包含任意类型的值）
  - 元组 {1, 2, :ok, "next"} 通常是2到死个元素
  - 列表 [] 链式数局结构1 in  [1, 2,4] ++ [2, 3] — [1, 2]
    - 关键字列表 [name: "dave"] == [{:name, "dave"}]
  - 散列表 %{key=>value} key 可以是任意类型，用[key]访问 当key是atom 可表示为 %{:atom: value} 只有原子类型可用点访问
  - 二进制
    - <<1, 2>> 没怎么明白，

  ## 命名规范

  ​

  - 模块，记录，协议和行为 大驼峰命名
  - 其他一般是小写，或者以下划线开头(变量在模式匹配和函数参数列表中未被使用，elixir不发出⚠️)

  ## 真值

  ```elixir
  true, false, nil
  ```

  ### 布尔运算 => 这些运算符优先计算第一个参数的真值

  ```elixir
  a or b #若a为真则为真，否则求b

  a and b #若a为假则为假，否则求b

  not a #若a为真则为假的，否则为真

  ```

  ## 松弛布尔运算 => 这些运算符接受任意类型的值（除了nil 和 false 解释为 truthy）

  ```elixir
  a || b # a 为truthy 则为a，否则为b
  a && b # a = truthy  则为b
  !a # a = truthy 则假，否则为真
  ```

  ### 算术运算符

  ```elixir
  + - * / div rem
  ```

  - div(a, b) 返回整数值
  - rem(-11, 3) => -2 返回结果的符号和第一个值相等

  ###  连接运算符

  ```elixir
  binary <> binary2
  list2 ++ list3
  list1 -- list2
  ```

  in 运算符

  ```elixir
  a in enum # 测试a是否被包含在某个枚举中(列表，区间)
  ```

  ​

  ​

  ---

  ​

  函数可以在程序的任意位置定义


## 匿名函数

```elixir
fn
	parameter-list -> body
	parameter-list -> body
end
fn -> body end
fn.(parameter-list)
fn.() 

handle_open = fn
	{:ok, file} -> "Read data: #{IO.read(file, :line)}"
	{_, error} -> "Error: #{:file.format_error(error)}"
	end
```

 &函数捕获运算符	

&Enum.cout(&1)

everything is done