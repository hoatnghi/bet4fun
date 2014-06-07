<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>BET BET BET</title>

	</head>
	<body>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="${resource(dir: 'images/gallery', file: 'world-cup-2014.jpg')}" width="100%"/>
                                <div class="carousel-caption">
                                    <h1>World Cup 2014 - Brasil</h1>
                                </div>
                            </div>
                            <div class="item">
                                <img src="${resource(dir: 'images/gallery', file: 'world-cup-2014-stadiums.jpg')}" width="100%"/>
                                <div class="carousel-caption">
                                    <h1>World Cup 2014 - Stadiums</h1>
                                </div>
                            </div>
                            <div class="item">
                                <img src="${resource(dir: 'images/gallery', file: 'World-Cup-2014-Map.jpg')}" width="100%"/>
                                <div class="carousel-caption">
                                    <h1>World Cup 2014 - Map</h1>
                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    <script>
        // Activates the Carousel
        $('.carousel').carousel({
            interval: 3000
        })
    </script>
	</body>
</html>
