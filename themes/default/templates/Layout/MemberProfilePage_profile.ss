<div class="typography row content">
	<section class="eight columns">
	<div class="content-container">
		<article>
			<div class="content">$Content

			<% if $CanAddMembers %>
				<h3><%t MemberProfiles.ADDMEMBER 'Add Member' %></h3>
				<p><%t MemberProfiles.ADDMEMBERLINK 'You can use this page to <a href="{addLink}">add a new member</a>.' addLink=$Link(add) %></p>

				<h3><%t MemberProfiles.YOURPROFILE 'Your Profile' %></h3>
				$Form
			<% else %>
				$Form
			<% end_if %>
			$PageComments
			</div>
		</article>
	</div>
	</section>
	<section class="four columns">
		<% include Sidebar %>
	</section>
</div>
