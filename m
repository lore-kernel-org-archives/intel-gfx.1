Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19942C05027
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Feb 2023 14:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6A210E576;
	Thu,  2 Feb 2023 14:24:58 +0000 (UTC)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8C910E4C8;
 Mon, 23 Jan 2023 15:23:25 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pJyfK-002YAC-Ph; Mon, 23 Jan 2023 16:23:22 +0100
Received: from dynamic-077-011-154-164.77.11.pool.telefonica.de
 ([77.11.154.164] helo=[192.168.1.11])
 by inpost2.zedat.fu-berlin.de (Exim 4.95) with esmtpsa (TLS1.3)
 tls TLS_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pJyfK-003fd5-JQ; Mon, 23 Jan 2023 16:23:22 +0100
Message-ID: <3c426ff9-e2de-86ee-6b49-443fea3437ff@physik.fu-berlin.de>
Date: Mon, 23 Jan 2023 16:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <Y8kDk5YX7Yz3eRhM@linux-uq9g>
 <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
 <43ed96bc-5a70-ba61-1959-fcb2fe86387e@suse.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <43ed96bc-5a70-ba61-1959-fcb2fe86387e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.11.154.164
X-Mailman-Approved-At: Thu, 02 Feb 2023 14:24:10 +0000
Subject: Re: [Intel-gfx] [PULL] drm-misc-next
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
Cc: dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Thomas!

On 1/23/23 16:13, Thomas Zimmermann wrote:
>>> Driver Changes:
>>>
>>>  * Remove obsolete drivers for userspace modesetting i810, mga, r128,
>>>    savage, sis, tdfx, via
>>
>> Is the Rage 128 GPU still supported via the generic modesetting driver?
>>
>> I'm asking because, we're still supporting PowerMacs in Debian Ports of which
>> some of those are sporting a Rage 128 GPU. Similar question applies to the
>> i810 GPU used in some old ThinkPads, for example.
> 
> Yes, all of those chips are still supported by the generic modesetting drivers
> and even the old userspace Xorg drivers.

OK, good to know.

> The only thing that is not supported any longer is hardware-accelerated 3d rendering.
> However, this has not worked anyway, as Mesa has dropped support for those chips a long
> time ago.

Correct me if I'm wrong, but I thought that's what Mesa Classic was forked off for?

Thanks,
Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

