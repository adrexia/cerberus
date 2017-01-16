<div class="splash-overlay cropped <% if $Event && $Event.Colour %>$Event.Colour<% else %><% if $Colour %>$Colour<% else %>$Level(1).Colour<% end_if %><% end_if %>">
	<% include Navbar %>

	<div class="splash" style="background-image: url('<% if $Event && $Event.SplashImage %>$Event.SplashImage.URL<% else %><% if $SplashImage %>$SplashImage.URL<% else %>$Level(1).SplashImage.URL<% end_if %><% end_if %>');"></div>
	<div class="overlay"></div>

	<header class="page-header">
		<div class="row">
			<div class="centered eight columns" id="main">


				<% include Title Title=$Title %>
				<% if $Intro %>
				<p class="lead <% if not $JoinLink.LinkURL %>pbl<% end_if %>">
					$Intro
				</p>
				<% end_if %>


				<% if $JoinLink.LinkURL %>
				<span class="btn large">
					<a href="$JoinLink.LinkURL">Join Now!</a>
				</span>
				<% end_if %>

			</div>
		</div>
	</header>
</div>
