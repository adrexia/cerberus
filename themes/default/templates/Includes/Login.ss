<div class="row login-row">
	<div class="columns twelve">
		<p class="btn-login pull-right">
			<% if $CurrentMember %>
			<span class="meta-data">
				<a href="$MemberProfilePage.Link">
					<i class="icon icon-user"></i>
					$CurrentMember.FirstName
				</a>
			</span>

			<% end_if %>
			<span class="login">
				<% if $CurrentMember %>
					<a href="{$BaseHref}Security/logout?BackURL={$Link}">
						Log out
					</a>
				<% else %>
					<a href="{$BaseHref}Security/login?BackURL={$Link}">
						<i class="icon icon-user"></i>
						Login
					</a>
				<% end_if %>
			</span>
		</p>
	</div>
</div>
