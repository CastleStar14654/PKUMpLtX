#!/usr/bin/env python3

import numpy as np
import matplotlib.pyplot as plt
plt.style.use('fig.mplstyle')

ts = np.linspace(0., 8.)
plt.plot(ts, .5*4*ts**2, label='Uniformly accelerated motion, $x=\\frac{1}{2}at^2$')
plt.plot(ts, 15*ts, '--', label='Uniform linear motion, $x=vt$')

plt.xlabel('$t$ (s)')
plt.ylabel('$x$ (m)')
plt.legend()

plt.tight_layout()
plt.savefig('fig/figsample.pdf')
