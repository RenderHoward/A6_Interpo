Prerequisites:

Octave

> image package: https://gnu-octave.github.io/packages/image/
    
Files:

> Input data: 

```
TiePoints.dat
```

> Code:	

```
interpo.m
```

> Output plots:


```
figHigh.pdf
figLow.pdf
```

Design intention:

> `interpo.m` first loads given sample points and uses a Delaunay mesh to make a low res, limited bandwidth interpolation to a grid suitable for a 2D FFT.  This is then embedded in a larger field wherein all high frequency components are set to zero.  The larger FT is inverted yielding a smooth, high res version preserving the lower spatial frequencies pulled from first FFT.

 Improvements:
 
> Use of a non-uniform discrete FT tool like: https://finufft.readthedocs.io/en/latest/
 can produce the bandwidth limited uniform DFT intermediate result embedded in larger field above, without Delaunay step.  More subtle boundary handling and windowing in frequency space could result in more natural edge effects. 