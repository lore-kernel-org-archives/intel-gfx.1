Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B33C636D7
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Feb 2023 16:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557A110E881;
	Tue, 21 Feb 2023 16:29:27 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D0110E87C;
 Tue, 21 Feb 2023 16:29:24 +0000 (UTC)
Received: from [192.168.2.6] (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 434CC66021C8;
 Tue, 21 Feb 2023 16:29:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676996963;
 bh=MVP/HL4CS56Ero1ZvMtd3xZZr01ZSrTJIpzkdr9pGKQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=EyqRnfn+oCempTNQnS2c99HtMco/8rIpJxxibelepuKylqhrW/WIg/KPsWnqTu4/+
 3DkbgY+ospi61HXh+y/KItE9BPVunlvWd5bI6se0GXS3/G2jOjqip7Qtr/se6B5yi7
 XeiOH1rJeX19QrsDNwNU+RklNKk6jyAmuzKJNrZQ5BdxtxJtygaRH6GSbXB9vSTVt0
 NN5rcr/A8sJBTJdxw7GvmJGJEqRJ/KqH7RbhBn2FoljlhsuwGfBQmnh7GBk3Vkl+1w
 Qspk+WnZG8M1vzPVwlLqffZ6d/O0rrbuqrkwLNyxiXKE5+aorRkRkI5X37ZqsVdYcL
 WItFklde0Y//w==
Message-ID: <992eefe3-1ab8-b8ba-02d4-9bb9f9755688@collabora.com>
Date: Tue, 21 Feb 2023 19:29:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1676580180.git.jani.nikula@intel.com>
 <ed745bf1-eeca-6431-b828-e0f51b8bad30@collabora.com>
In-Reply-To: <ed745bf1-eeca-6431-b828-e0f51b8bad30@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/displayid: use primary use case to
 figure out non-desktop
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Iaroslav Boliukin <iam@lach.pw>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 2/20/23 18:44, Dmitry Osipenko wrote:
> On 2/16/23 23:44, Jani Nikula wrote:
>> Mostly this is prep work and plumbing for easier use of displayid
>> structure version and primary use case for parsing the displayid blocks,
>> but it can be nicely used for figuring out non-desktop too.
>>
>> Completely untested. :)
>>
>> BR,
>> Jani.
>>
>> Cc: Iaroslav Boliukin <iam@lach.pw>
>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> Jani Nikula (4):
>>   drm/displayid: add displayid_get_header() and check bounds better
>>   drm/displayid: return struct displayid_header from
>>     validate_displayid()
>>   drm/displayid: provide access to DisplayID version and primary use
>>     case
>>   drm/edid: update non-desktop use also from DisplayID
>>
>>  drivers/gpu/drm/drm_displayid.c | 62 ++++++++++++++++++++++++++++-----
>>  drivers/gpu/drm/drm_edid.c      | 25 +++++++++++++
>>  include/drm/drm_displayid.h     | 12 ++++++-
>>  3 files changed, 89 insertions(+), 10 deletions(-)
>>
> 
> It works now without the EDID quirk, thanks!
> 
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 

I'm going to apply this to misc-next later this week if there won't be
any objections.

-- 
Best regards,
Dmitry

