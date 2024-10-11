# RECURSIVE

```
FIBONACCI(n)
if n == 0 or n == 1
  return n
return FIBONACCI(n-1) + FIBONACCI(n-2)
```

# DP

DATA: dp[0..n]

- dp[i] = i : i = 0 or i = 1
- dp[i] = -1 : default (has not been set)
- FIBONACCI[i] : otherwise

```
FIBONACCI(n)
if dp[n] == -1
  dp[n] = FIBONACCI(n-1) + FIBONACCI(n-2)
return dp[n]
```

# BOTTOM UP

```
FIBONACCI(n)
if (n < 2) return n
m2 = 0;
m1 = 1;
for i = 2 to n-1
  swap(m1, m2)
  m1 = m1 + m2

return m1+m2;
```
