= (WktPoint as text,WktPolygon as text) as logical=> 
let
    Point = Geography.FromWellKnownText(WktPoint),
    Polylist = Geography.FromWellKnownText(WktPolygon)[Rings]{0}[Points],
    Edges = List.Zip({List.RemoveLastN(Polylist,1),List.RemoveFirstN(Polylist,1)}),
    Crossed = List.Select(Edges,each 
        (_{0}[Latitude]>Point[Latitude] <> _{1}[Latitude]>Point[Latitude]) 
          and 
        (Point[Longitude] < 
            (_{0}[Longitude]-_{1}[Longitude]) * (Point[Latitude]-_{1}[Latitude]) / (_{0}[Latitude]-_{1}[Latitude]) 
            + _{1}[Longitude])
    ),
    Result = Number.IsOdd(List.Count(Crossed))
in
    Result
