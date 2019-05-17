# use http://www.pythontutor.com/visualize.html for visualization

def combine_colors(hs, ss, vs, h_delta, s_delta, v_delta, step, xs):
    if step > 0:
        xs.append(combine_colors(hs + h_delta, ss + s_delta, vs + v_delta, h_delta, s_delta, v_delta, step - 1, [(hs + h_delta, ss + s_delta, vs + v_delta)]))
    else:
        xs.append((hs + h_delta, ss + s_delta, vs + v_delta))
    return xs

hs = 60
ss = 50
vs = 50
he = 120
se = 100
ve = 100

step = 3

h_delta = int(abs(he - hs) / step + 0.5)
s_delta = int(abs(se - ss) / step + 0.5)
v_delta = int(abs(ve - vs) / step + 0.5)

result = combine_colors(hs, ss, vs, h_delta, s_delta, v_delta, step, [])
print(result)
