# Power BI lacks a native solution for Point-in-Polygon

## What is Point-in-Polygon?

Point-in-Polygon is a geometric function used in geospatial analysis to determine if a point is inside or outside a defined area. The area is represented by a polygon, a closed shape defined by a series of connected points.

The function takes a point and a polygon as inputs and returns whether the point is inside the polygon:

```
PointInPolygon(Point, Polygon)
```

A practical example might involve a dataset containing latitude and longitude coordinates for events like lightning strikes, train stops, or photo locations. 
By applying Point-in-Polygon, you can determine which city or country each event occurred in. 
This is a form of reverse geocoding, where the event’s coordinates are compared to the boundary of a geographic area (e.g., a city or country).

The function returns TRUE or FALSE based on whether the point is inside or outside the polygon.
The image above illustrates how Point-in-Polygon works: on the left, individual points, while on the right, Point-in-Polygon has been applied, categorizing the points as either inside (TRUE) or outside (FALSE) the polygon.
This category allows to analyze how many points fall inside the polygon and to color-code the points.

## Point-in-Polygon in Power BI

Power BI has three layers to work with data: 

* **Power Query** for transforming data
* **DAX** for modeling data
* **Visuals** for presenting data
