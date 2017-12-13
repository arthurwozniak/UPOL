class BasicGraph {
    constructor(values) {
        this.values = values;
        this.description = undefined;
        this.legend = undefined;
        this.canvas = undefined;
        this.padding = 40;
        this.margin = 30;
        this.legend_visible = false;
        this.highlighted = []
        this.colors = this.values.map(function(i) {
            return "hsl(" + Math.random() * 360 + ", 50%, 50%)"
        });


    }

    draw() {
        console.log("clearing canvas");
        this.canvas.reset();
    }

    setCanvas(canvas_name) {
        this.canvas = oCanvas.create({
            canvas: "#" + canvas_name,
            background: "#D3D3D3",
            fps: 60
        });
    }

    setBackgroundColor(color) {
        this.canvas.background.set(color);
    }

    addChild(child) {
        this.values.push(child);
        this.colors.push("hsl(" + Math.random() * 360 + ", 50%, 50%)")
    }

    setDescription(description) {
        this.description = description;
    }

    drawDescription() {
        var text = this.canvas.display.text({
            x: this.canvas.width / 2,
            y: this.margin,
            origin: {
                x: "center",
                y: "bottom"
            },
            font: "bold 30px helvetica",
            text: this.description,
            fill: "#0aa"
        });

        this.canvas.addChild(text);
    }

    highlightItem(itemIndex) {
        this.highlighted.push(itemIndex)
    }

    resetHighlight() {
        this.highlighted = []

    }

    highlight(items) {
        this.resetHighlight();
        for (var item in items) {
            this.highlightItem(items[item]);
        }
    }

    legendVisibility(visibility) {
        this.legend_visible = visibility;
        this.draw();
        this.highlight(this.highlighted)
    }
}

class BarGraph extends BasicGraph {
    // values [[value, name],...]

    highlightItem(itemIndex) {
        super.highlightItem(itemIndex);
        if (0 <= itemIndex < this.values.length) {
            var canvasItem = this.canvas.children[this.values.length - itemIndex - 1];
            canvasItem.stroke = "inside 5px rgba(255, 0, 0, 0.8)";
            canvasItem.redraw();
        } else {
            console.log("Invalid index: " + itemIndex);
        }
    }

    resetHighlight() {
        for (var i in this.values) {
            var canvasItem = this.canvas.children[this.values.length - i - 1];
            canvasItem.stroke = "";
            canvasItem.redraw();
        }
    }


    drawAxes() {
        var line = this.canvas.display.line({
            start: {
                x: this.margin,
                y: this.canvas.height / 2
            },
            end: {
                x: this.canvas.width - this.margin,
                y: this.canvas.height / 2
            },
            stroke: "1px #000",
            cap: "line"
        });
        this.canvas.addChild(line)

        var line2 = this.canvas.display.line({
            start: {
                x: 2 * this.margin,
                y: this.margin
            },
            end: {
                x: 2 * this.margin,
                y: this.canvas.height - this.margin
            },
            stroke: "1px #000",
            cap: "line"
        });
        this.canvas.addChild(line2)
        var start = this.canvas.height / 2 - ((this.canvas.height / 2 - 2 * this.margin) / this.diff) * this.max

        for (var i = 0; i <= this.values.length; i++) {
            console.log(i)
            var line2 = this.canvas.display.line({
                start: {
                    x: 2 * this.margin - 5,
                    y: start
                },
                end: {
                    x: 2 * this.margin + 5,
                    y: start
                },
                stroke: "1px #000",
                cap: "line"
            });
            this.canvas.addChild(line2)
            var text = this.canvas.display.text({
                x: line2.start.x - 5,
                y: line2.start.y,
                origin: {
                    x: "right",
                    y: "center"
                },
                font: "bold 17px helvetica",
                text: Math.round((this.max - i * (this.diff / this.values.length)) * 10) / 10,
                fill: "#FFF"
            });
            this.canvas.addChild(text);

            start = start + ((this.canvas.height / 2 - 2 * this.margin) / this.diff) * (this.diff / this.values.length)
        }

    }


    draw() {
        super.draw();
        console.log("Drawing BarGraph");
        var bar_w = (this.canvas.width - (4 * this.margin + (this.values.length - 1) * this.padding)) / this.values.length;
        var values = this.values.map(function(i) {
            return i[0]
        });
        var description = this.values.map(function(i) {
            return i[1]
        });
        console.log(description)
        this.min = Math.min.apply(null, values);
        this.max = Math.max.apply(null, values);
        this.diff = this.max - this.min;


        this.drawDescription();
        this.drawAxes();


        console.log(bar_w);

        var min = Math.min.apply(null, values);
        var max = Math.max.apply(null, values);
        for (var i = 0; i < this.values.length; i++) {
            var rectangle = this.canvas.display.rectangle({
                x: 2 * this.margin + i * this.padding + i * bar_w,
                y: this.canvas.height / 2 - 100 - 1.5,
                width: bar_w,
                height: values[i] * ((this.canvas.height / 2 - 2 * this.margin) / this.diff),
                fill: this.colors[i]
            });
            rectangle.y = this.canvas.height / 2 - rectangle.height;
            this.canvas.addChild(rectangle);
            rectangle.zIndex = "back";
            var text = this.canvas.display.text({
                x: rectangle.width / 2,
                y: rectangle.height / 2,
                origin: {
                    x: "center",
                    y: "center"
                },
                font: "bold 30px helvetica",
                text: values[i],
                fill: "#FFF"
            });
            var text2 = text.clone();
            text2.text = description[i];
            if (values[i] < 0) {
                text2.origin.y = "top";
            } else {
                text2.origin.y = "bottom";
            }
            text2.y = 0;

            rectangle.addChild(text);
            if (this.legend_visible) {
                rectangle.addChild(text2);
            }
        }
    }
}

class ScatterGraph extends BasicGraph {
    // values [[value, name],...]

    highlightItem(itemIndex) {
        super.highlightItem(itemIndex);

        if (0 <= itemIndex < this.values.length) {
            var canvasItem = this.canvas.children[this.values.length - itemIndex - 1];
            canvasItem.stroke = "outside 2px rgba(255, 0, 0, 0.8)";
            canvasItem.redraw();
        } else {
            console.log("Invalid index: " + itemIndex);
        }
    }

    resetHighlight() {
        for (var i in this.values) {
            var canvasItem = this.canvas.children[this.values.length - i - 1];
            canvasItem.stroke = "";
            canvasItem.redraw();
        }

    }


    drawAxes() {
        var line = this.canvas.display.line({
            start: {
                x: this.margin,
                y: this.canvas.height / 2
            },
            end: {
                x: this.canvas.width - this.margin,
                y: this.canvas.height / 2
            },
            stroke: "1px #000",
            cap: "line"
        });
        this.canvas.addChild(line)

        var line2 = this.canvas.display.line({
            start: {
                x: 2 * this.margin,
                y: this.margin
            },
            end: {
                x: 2 * this.margin,
                y: this.canvas.height - this.margin
            },
            stroke: "1px #000",
            cap: "line"
        });
        this.canvas.addChild(line2)
        var start = this.canvas.height / 2 - ((this.canvas.height / 2 - 2 * this.margin) / this.diff) * this.max

        for (var i = 0; i <= this.values.length; i++) {
            console.log(i)
            var line2 = this.canvas.display.line({
                start: {
                    x: 2 * this.margin - 5,
                    y: start
                },
                end: {
                    x: 2 * this.margin + 5,
                    y: start
                },
                stroke: "1px #000",
                cap: "line"
            });
            this.canvas.addChild(line2)
            var text = this.canvas.display.text({
                x: line2.start.x - 5,
                y: line2.start.y,
                origin: {
                    x: "right",
                    y: "center"
                },
                font: "bold 17px helvetica",
                text: Math.round((this.max - i * (this.diff / this.values.length)) * 10) / 10,
                fill: "#FFF"
            });
            this.canvas.addChild(text);

            start = start + ((this.canvas.height / 2 - 2 * this.margin) / this.diff) * (this.diff / this.values.length)
        }

    }


    draw() {
        super.draw();
        console.log("Drawing BarGraph");
        var bar_w = (this.canvas.width - (4 * this.margin + (this.values.length - 1) * this.padding)) / this.values.length;
        var values = this.values.map(function(i) {
            return i[0]
        });
        var description = this.values.map(function(i) {
            return i[1]
        });
        console.log(description)
        this.min = Math.min.apply(null, values);
        this.max = Math.max.apply(null, values);
        this.diff = this.max - this.min;


        this.drawDescription();
        this.drawAxes();


        console.log(bar_w);

        var min = Math.min.apply(null, values);
        var max = Math.max.apply(null, values);
        console.log("foo")
        console.log((this.canvas.height / 2 - 100 - 1.5))
        for (var i = 0; i < this.values.length; i++) {
            console.log(values[i] * ((this.canvas.height / 2 - 2 * this.margin) / this.diff))
            var rectangle = this.canvas.display.rectangle({
                x: 2 * this.margin + i * this.padding + i * bar_w,
                y: (this.canvas.height / 2) - values[i] * ((this.canvas.height / 2 - 2 * this.margin) / this.diff),
                width: 10,
                height: 10,
                origin: {
                    x: "center",
                    y: "center"
                },
                fill: this.colors[i]
            });
            rectangle.rotate(45);
            //rectangle.y = this.canvas.height / 2 - rectangle.height;
            this.canvas.addChild(rectangle);
            rectangle.zIndex = "back";
            var text = this.canvas.display.text({
                x: rectangle.width / 2,
                y: rectangle.height / 2,
                origin: {
                    x: "left",
                    y: "bottom"
                },
                font: "bold 30px helvetica",
                text: values[i],
                fill: "#FFF"
            });
            text.rotate(-45);
            var text2 = text.clone();
            text2.text = description[i];
            text2.origin.y = "top";
            text2.y = 0;

            rectangle.addChild(text);
            if (this.legend_visible) {
                rectangle.addChild(text2);
            }
        }
    }
}

class LineScatterGraph extends BasicGraph {
    // values [[value, name],...]

    highlightItem(itemIndex) {
        super.highlightItem(itemIndex);

        if (0 <= itemIndex < this.values.length) {
            var canvasItem = this.canvas.children[2 * this.values.length - 2 * itemIndex - 1];
            canvasItem.stroke = "outside 2px rgba(255, 0, 0, 0.8)";
            canvasItem.redraw();
        } else {
            console.log("Invalid index: " + itemIndex);
        }
    }

    resetHighlight() {
        for (var i in this.values) {
            var canvasItem = this.canvas.children[2 * this.values.length - 2 * i - 1];
            canvasItem.stroke = "";
            canvasItem.redraw();
        }

    }


    drawAxes() {
        var line = this.canvas.display.line({
            start: {
                x: this.margin,
                y: this.canvas.height / 2
            },
            end: {
                x: this.canvas.width - this.margin,
                y: this.canvas.height / 2
            },
            stroke: "1px #000",
            cap: "line"
        });
        this.canvas.addChild(line)

        var line2 = this.canvas.display.line({
            start: {
                x: 2 * this.margin,
                y: this.margin
            },
            end: {
                x: 2 * this.margin,
                y: this.canvas.height - this.margin
            },
            stroke: "1px #000",
            cap: "line"
        });
        this.canvas.addChild(line2)
        var start = this.canvas.height / 2 - ((this.canvas.height / 2 - 2 * this.margin) / this.diff) * this.max

        for (var i = 0; i <= this.values.length; i++) {
            console.log(i)
            var line2 = this.canvas.display.line({
                start: {
                    x: 2 * this.margin - 5,
                    y: start
                },
                end: {
                    x: 2 * this.margin + 5,
                    y: start
                },
                stroke: "1px #000",
                cap: "line"
            });
            this.canvas.addChild(line2)
            var text = this.canvas.display.text({
                x: line2.start.x - 5,
                y: line2.start.y,
                origin: {
                    x: "right",
                    y: "center"
                },
                font: "bold 17px helvetica",
                text: Math.round((this.max - i * (this.diff / this.values.length)) * 10) / 10,
                fill: "#FFF"
            });
            this.canvas.addChild(text);

            start = start + ((this.canvas.height / 2 - 2 * this.margin) / this.diff) * (this.diff / this.values.length)
        }

    }


    draw() {
        super.draw();
        console.log("Drawing LineScatterGraph");
        var bar_w = (this.canvas.width - (4 * this.margin + (this.values.length - 1) * this.padding)) / this.values.length;
        var values = this.values.map(function(i) {
            return i[0]
        });
        var description = this.values.map(function(i) {
            return i[1]
        });
        console.log(description)
        this.min = Math.min.apply(null, values);
        this.max = Math.max.apply(null, values);
        this.diff = this.max - this.min;


        this.drawDescription();
        this.drawAxes();


        console.log(bar_w);

        var min = Math.min.apply(null, values);
        var max = Math.max.apply(null, values);
        console.log("foo")
        console.log((this.canvas.height / 2 - 100 - 1.5))
        var previous = undefined;
        for (var i = 0; i < this.values.length; i++) {
            console.log(values[i] * ((this.canvas.height / 2 - 2 * this.margin) / this.diff))
            var rectangle = this.canvas.display.rectangle({
                x: 2 * this.margin + i * this.padding + i * bar_w,
                y: (this.canvas.height / 2) - values[i] * ((this.canvas.height / 2 - 2 * this.margin) / this.diff),
                width: 10,
                height: 10,
                origin: {
                    x: "center",
                    y: "center"
                },
                fill: this.colors[i]
            });
            rectangle.rotate(45);
            //rectangle.y = this.canvas.height / 2 - rectangle.height;
            this.canvas.addChild(rectangle);

            rectangle.zIndex = "back";

            if (previous) {
                var line = this.canvas.display.line({
                    start: {
                        x: previous[0],
                        y: previous[1]
                    },
                    end: {
                        x: rectangle.x,
                        y: rectangle.y
                    },
                    stroke: "2px #a3a3a3",
                    cap: "line"
                });
                this.canvas.addChild(line)
                line.zIndex = "back";
            }
            previous = [rectangle.x, rectangle.y]
            var text = this.canvas.display.text({
                x: rectangle.width / 2,
                y: rectangle.height / 2,
                origin: {
                    x: "left",
                    y: "bottom"
                },
                font: "bold 30px helvetica",
                text: values[i],
                fill: "#FFF"
            });
            text.rotate(-45);
            var text2 = text.clone();
            text2.text = description[i];
            text2.origin.y = "top";
            text2.y = 0;

            rectangle.addChild(text);
            if (this.legend_visible) {
                rectangle.addChild(text2);
            }
        }
    }
}


class PieGraph extends BasicGraph {
    // values [[value, name],...]

    highlightItem(itemIndex) {
        super.highlightItem(itemIndex);

        if (0 <= itemIndex < this.values.length) {
            var canvasItem = this.canvas.children[itemIndex ];
            canvasItem.stroke = "center 5px rgba(255, 0, 0, 0.8)";
            canvasItem.redraw();
        } else {
            console.log("Invalid index: " + itemIndex);
        }
    }

    resetHighlight() {
        super.resetHighlight()
        for (var i in this.values) {
            var canvasItem = this.canvas.children[i];
            canvasItem.stroke = "";
            canvasItem.redraw();
        }
        this.canvas.redraw()
    }

    drawLegend() {
        var bar_w = (this.canvas.width - (2 * this.margin + (this.values.length - 1) * this.padding)) / this.values.length;
        var legendPrototype = this.canvas.display.rectangle({
            ẍ: 2 * this.margin,
            y: this.canvas.height - 2 * this.margin,
            width: bar_w,
            height: 10
        });
        for (var i = 0; i < this.values.length; i++) {
            var n = legendPrototype.clone({
                x: this.margin + i * (bar_w + this.padding),
                fill: this.colors[i]
            });

            var value_text = this.canvas.display.text({
                x: n.width / 2,
                y: n.height / 2,
                origin: {
                    x: "center",
                    y: "bottom"
                },
                font: "bold 30px helvetica",
                text: this.values[i][0],
                fill: "#FFF"
            });

            var desc_text = value_text.clone({
                origin: {
                    x: "center",
                    y: "top"
                },
                text: this.values[i][1]
            })

            n.addChild(value_text)
            n.addChild(desc_text)
            this.canvas.addChild(n)


        }

    }


    draw() {
        super.draw();
        console.log("Drawing PieGraph");
        this.drawDescription();
        var prototype = this.canvas.display.arc({
            x: this.canvas.width / 2,
            y: this.canvas.height / 2,
            radius: Math.min(canvas.width / 2, (canvas.height - 100) / 2) - 2 * this.margin,
            pieSection: true
        });

        var values = this.values.map(function(i) {
            return i[0]
        });
        var description = this.values.map(function(i) {
            return i[1]
        });

        console.log(values);
        var sum = values.reduce((a, b) => Math.abs(a) + Math.abs(b), 0);

        var pieces = [],
            end, lastEnd, lastX, lastY;
        lastX = 0;
        lastY = 0;
        for (var i = 0; i < values.length; i++) {

            end = (i > 0 ? lastEnd : 0) + ((360 / sum) * Math.abs(values[i]))
            console.log(end)

            pieces.push(prototype.clone({
                start: (i < 1 ? -90 : lastEnd),
                end: end,
                fill: this.colors[i]
            }));

            this.canvas.addChild(pieces[i]);
            lastEnd = end;


            pieces[i]._start = pieces[i].start;
            pieces[i]._end = pieces[i].end;

        }
        if (this.legend_visible) {
            this.drawLegend();
        }

    }
}


var a = new BarGraph([
    [-1, "bar"],
    [-2, "baz"],
    [30, "qaz"],
    [-4, "qux"],
    [-50, "fux"]
]);
a.setCanvas("canvas");
a.setDescription("BarGraph example")
a.draw()
a.highlightItem(2)
a.legendVisibility(true)



var b = new ScatterGraph([
    [-1, "bar"],
    [-2, "baz"],
    [30, "qaz"],
    [-4, "qux"],
    [-50, "fux"]
]);
b.setCanvas("canvas2");
b.setDescription("ScatterGraph example")
b.draw()
b.highlightItem(2)
b.legendVisibility(true)


var c = new LineScatterGraph([
    [-1, "bar"],
    [-2, "baz"],
    [30, "qaz"],
    [-4, "qux"],
    [-50, "fux"]
]);
c.setCanvas("canvas3");
c.setDescription("LineScatterGraph example")
c.draw()
c.highlightItem(2)
c.legendVisibility(true)


var d = new PieGraph([
    [-1, "bar"],
    [-2, "baz"],
    [30, "qaz"],
    [-4, "qux"],
    [-50, "fux"]
]);
d.setCanvas("canvas4");
d.setDescription("PieGraph example")
d.draw()
d.highlightItem(2)
d.legendVisibility(true)
