<% with $SiteConfig %>
<footer class="footer" role="contentinfo">
	<div class="row">
		<div class="columns twelve">
			<% if $FooterBannerLink %>
			<a href="$FooterBannerLink.Link" class="footer-bannerlink">
				<span class="sr-only">
					$FooterBannerLink.Title
				</span>
			<% end_if %>
				<% if $FooterBanner %>
					<img src="$FooterBanner.Link" alt="" class="footer-banner" />
				<% end_if %>
			<% if $FooterLink %>
			</a>
			<% end_if %>
		</div>
	</div>
	<div class="navbar">
		<% if $FacebookURL || $TwitterUsername %>

			<% if $TwitterUsername %>
				<a class="meta-data pts pull-right" href="http://www.twitter.com/$TwitterUsername"><i class="icon-twitter icon-dark" aria-hidden="true"></i><span class="nonvisual-indicator">Follow us on Twitter</span></a>
			<% end_if %>
			<% if $FacebookURL %>
				<a class="meta-data pts pull-right" href="http://www.facebook.com/$FacebookURL"><i class="icon-facebook icon-dark" aria-hidden="true"></i><span class="nonvisual-indicator">Join us on Facebook</span></a>
			<% end_if %>

		<% end_if %>
		<p class="right">&copy; NZLarps 2008 - 2016</p>

	</div>
</footer>
<% end_with %>
