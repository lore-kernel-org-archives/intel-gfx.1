Return-Path: <SRS0=tjjx=FZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7E9C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Dec 2020 14:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6AB22BEF
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Dec 2020 14:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D6AB22BEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3666E17C;
	Mon, 21 Dec 2020 14:07:37 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D466E17C
 for <intel-gfx@lists.freedesktop.org>; Mon, 21 Dec 2020 14:07:35 +0000 (UTC)
IronPort-SDR: QUjXajoWsMPf8lz623qC25tN3Xq3kg5h0nub4qysc4FFBAGNevSzdxTOhTpdJI9n1z2IW/hmWY
 pQMJF0xGzAXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="154944567"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="154944567"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 06:04:49 -0800
IronPort-SDR: 1HbiopEOcw3JcY0gtMjlCGgHDkcEZfkYn+eYEeGhvihLpQxzrMOUgQtt1ATME2gq1pzvYdAfgp
 aIKmYB4oZ5rQ==
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="456424423"
Received: from mlesiews-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.213.22.241])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 06:04:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Paul Gardiner <lists@glidos.net>, intel-gfx@lists.freedesktop.org
In-Reply-To: <516f2e64-9f6b-f729-cbcd-6458997da377@glidos.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ac472118-be43-dc8d-87a3-c4d17c9d9f26@glidos.net>
 <87sg98ox2i.fsf@intel.com> <d89b2287-51dc-87a5-4e38-022b0b8da648@glidos.net>
 <87v9dwm4fy.fsf@intel.com> <8705b7e4-9dba-1496-fdbb-15016be15fe6@glidos.net>
 <81a0f2f9-8669-8409-1ca5-8111bedef6b1@glidos.net> <87ft4f9t8x.fsf@intel.com>
 <516f2e64-9f6b-f729-cbcd-6458997da377@glidos.net>
Date: Mon, 21 Dec 2020 16:04:45 +0200
Message-ID: <87eejjp85e.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] Does the intel driver support faking a connected
 monitor?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, 20 Dec 2020, Paul Gardiner <lists@glidos.net> wrote:
> The debug output was sufficient to track down the problem. It turned out 
> that the connection was called HDMI-A-1. When I used that name your 
> previous suggestion worked. To get exactly the behaviour I wanted I 
> needed to also load EDID. This is the extra boot command string I'm using:
>
>      drm.edid_firmware=HDMI-A-1:edid/marantz_edid.bin video=HDMI-A-1:D
>
>
> For that to work I also had to ensure the referenced edid file was in my 
> initramfs.
>
> Thanks again for the help.

I'm glad you figured it out, and thanks for letting us know!

> By the way, an EDID emulator is a small USB-stick-sized device that sits 
> in between computer and monitor and acts like a monitor when the actual 
> monitor is off.

Ah, thanks for the info.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
