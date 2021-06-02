

module triangle(a, b, h) {
    points = [
        [0, 0],
        [a, 0],
        [0, b]
    ];

    linear_extrude(h)
    polygon(points);
}

triangle(10, 20, 3);