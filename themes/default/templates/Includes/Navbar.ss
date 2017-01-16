<nav id="navbar" class="navbar" role="navigation">
	<div class="row">
		<h2 class="nonvisual-indicator">Main navigation</h2>
		<ul class="columns twelve">
			<li class="link logo <% if $URLSegment = home %> active current<% end_if %> <% if not $SiteConfig.Logo %>no-image<% end_if %>">
				<% if $SiteConfig.Logo %>
					<a class="<% if $URLSegment = home %>current<% end_if %>" title="Return to homepage" href="$BaseHref">
						<img src="$SiteConfig.Logo.URL" alt="$SiteConfig.Title logo" title="$SiteConfig.Title" />
						<span class="sr-only">$SiteConfig.Title</span>
					</a>
				<% else %>
				<a class="<% if $URLSegment = home %>current<% end_if %>" title="Return to homepage" href="$BaseHref">
					<span class="">$SiteConfig.Title</span>
				</a>
				<% end_if %>
			</li>
			<li class="pull-right link login">
				<% if $CurrentMember %>
					<a href="$MemberProfilePage.Link">
						$CurrentMember.FirstName
					</a>
					|
					<a href="{$BaseHref}Security/logout?BackURL={$Link}">Log out</a>
				<% else %>
					<a href="{$BaseHref}Security/login?BackURL={$Link}">Login</a>
				<% end_if %>
			</li>
			<% loop Menu(1) %>
				<% if $ClassName==HomePage %><% else_if $ClassName==RegistrationPage %>
					<% if not $getCurrentRegistration %>
						<li class="nav-$FirstLast $LinkingMode <% if $LinkingMode = current || $LinkingMode = section %> active<% end_if %>">
							<a class="$LinkingMode" href="$Link" title="$Title.XML">
								$MenuTitle.XML</a>
							</li>
					<% end_if %>
				<% else_if $ClassName==GameSignupPage %>
					<% if $getCurrentRegistration %>
						<li class="nav-$FirstLast $LinkingMode <% if $LinkingMode = current || $LinkingMode = section %> active<% end_if %>">
							<a class="$LinkingMode" href="$Link" title="$Title.XML">$MenuTitle.XML</a>
						</li>
					<% end_if %>
				<% else %>
					<li class="nav-$FirstLast $LinkingMode <% if $LinkingMode = current || $LinkingMode = section %> active<% end_if %>">
						<a href="$Link" title="$Title.XML" class="$LinkingMode">$MenuTitle.XML</a>
					</li>
				<% end_if %>

			<% end_loop %>
		</ul>
	</div>
</nav>
