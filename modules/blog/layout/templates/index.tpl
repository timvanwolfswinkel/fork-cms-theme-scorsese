{*
	variables that are available:
	- {$items}: contains an array with all posts, each element contains data about the post
*}

{option:!items}
	<div id="blogIndex">
		<div class="bd content">
			<p>{$msgBlogNoItems}</p>
		</div>
	</div>
{/option:!items}
{option:items}
	<div id="blogIndex">
		{iteration:items}
			<article class="article">
				<h3><a href="{$items.full_url}" title="{$items.title}">{$items.title}</a></h3>
				<p><span class="topInfo">{$items.publish_on|date:{$dateFormatLong}:{$LANGUAGE}} - 
					{option:!items.comments}<a href="{$items.full_url}#{$actComment}">{$msgBlogNoComments|ucfirst}</a>{/option:!items.comments}
					{option:items.comments}
						{option:items.comments_multiple}<a href="{$items.full_url}#{$actComments}">{$msgBlogNumberOfComments|sprintf:{$items.comments_count}}</a>{/option:items.comments_multiple}
						{option:!items.comments_multiple}<a href="{$items.full_url}#{$actComments}">{$msgBlogOneComment}</a>{/option:!items.comments_multiple}
					{/option:items.comments}
				</span></p>
				<div class="bd content">
					{option:items.image}<img src="{$FRONTEND_FILES_URL}/blog/images/source/{$items.image}" alt="{$items.title}" />{/option:items.image}
					{option:!items.introduction}{$items.text}{/option:!items.introduction}
					{option:items.introduction}{$items.introduction}{/option:items.introduction}
				</div>
				<p><span class="bottomInfo">{$msgWrittenBy|ucfirst|sprintf:{$items.user_id|usersetting:'nickname'}}
					{$lblIn} {$lblThe} {$lblCategory} <a href="{$items.category_full_url}" title="{$items.category_title}">{$items.category_title}</a>{option:!items.tags}.{/option:!items.tags}
					{option:items.tags}
						{$lblTags}: 
						{iteration:items.tags}
							<a href="{$items.tags.full_url}" rel="tag" title="{$items.tags.name}">{$items.tags.name}</a>{option:!items.tags.last}, {/option:!items.tags.last}{option:items.tags.last}.{/option:items.tags.last}
						{/iteration:items.tags}
					{/option:items.tags}
				</span></p>
			</article>
		{/iteration:items}
	</div>
	{include:core/layout/templates/pagination.tpl}
{/option:items}
