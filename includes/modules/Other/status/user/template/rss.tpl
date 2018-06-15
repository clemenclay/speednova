<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0"  xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title>{$bn} - Status Updates</title>
        <description>{$bn} - Status Updates</description>
        <link>{$url}</link>
        <atom:link href="{$url}" rel="self" type="application/rss+xml" />
        {foreach from=$items item=b}<item>
            <title>{$b.name}</title>
            <link>{$ca_url}status/{$b.id}/{$b.slug}/</link>
            <guid>{$ca_url}status/{$b.id}/{$b.slug}/</guid>
            <pubDate>{$b.date}</pubDate>
            <description><![CDATA[{$b.description}]]></description>
        </item>
        {/foreach}


</channel>
</rss>