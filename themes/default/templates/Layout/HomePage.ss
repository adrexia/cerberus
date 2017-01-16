<div class="typography row content">

	<section class="columns twelve">

        <div class="content content--lead">$Content</div>
        <div class="divider"></div>



		<div class="row">

			<% if $News %>
            <div class="columns eight">

				<div class="resultsHeader">
					<h2>News</h2>
				</div>
				<section class="pagination-content">
				<% loop News %>
					<article class="$EvenOdd $FirstLast">

							<header>
								<h3 id="ID-{$ID}">$Title
								<span class="meta-info">
									&mdash;&nbsp;
									<span>
										<time datetime="$Created">$Created.Format(d M Y)</time></span><em><% if Author %>, &nbsp;by $Author.LowerCase<% else %>by admin<% end_if %>
									</em>

								</span>

								</h3>
							</header>
							<div class="text">
								$Content
							</div>



					</article>
				<% end_loop %>
				</section>
				<div class="row">
					<div class="columns ten push_two">
					<% with News %>
						<% include Pagination %>
					<% end_with %>
					</div>
				</div>
			</div>
			<% end_if %>

			<% if $Sidebar %>
			<aside class="four columns sidebar content">
				<div class="sidebar-inner">
					$Sidebar
				</div>
			</aside>
			<% end_if %>
		</div>

		$Form
	</section>




	<% if $SponsorLinks %>
	<section class="sponsors">
		<ul class="nav size_{$SponsorLinks.Count()}">
			<% loop $getSponsorLinks %>
			<li>
				<% if $LinkURL %>
				<a href="$LinkURL" $TargetAttr>
					<span class="center">
						<span class="sr-only">$Title</span>
						$Logo
					</span>
				</a>
				<% end_if %>
			</li>
			<% end_loop %>
		</ul>
	</section>
	<% end_if %>
</div>
