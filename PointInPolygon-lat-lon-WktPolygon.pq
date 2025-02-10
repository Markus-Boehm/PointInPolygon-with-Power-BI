= (lat as number, lon as number ,WktPolygon as text) as logical => 
let
    Polylist = Geometry.FromWellKnownText(WktPolygon)[Rings]{0}[Points],
    Edges = List.Zip({List.RemoveLastN(Polylist,1),List.RemoveFirstN(Polylist,1)}),
    Crossed = List.Select(Edges,each 
        (_{0}[Y]>lat <> _{1}[Y]>lat) 
          and 
        (lon < (_{0}[X]-_{1}[X]) * (lat-_{1}[Y]) / (_{0}[Y]-_{1}[Y]) + _{1}[X])
    ),
    Result = Number.IsOdd(List.Count(Crossed))
in
    Result
