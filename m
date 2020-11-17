Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F95CC2D0E4
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 14:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2FD20BED
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 14:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA2FD20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFAA6E288;
	Tue, 17 Nov 2020 14:52:11 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1E36E288
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 14:52:10 +0000 (UTC)
IronPort-SDR: pZpx2QCLVQAY4OggALMTq5+k7wBXGkQS06naFT6ls3L6ybMEvsYth7eJRBzhAQW1/UxgL5xsCT
 3PNrrB6gB87Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="171036359"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="171036359"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 06:52:09 -0800
IronPort-SDR: 81zKrMcK+UNsdu2UqBTDmUZ6qaOQzYVkFuiwyop1NfZk6fOO3rSMLWX/Gh//sROU143jviJOvW
 B8TlQcN+LEbw==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="475948237"
Received: from nlugasi-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.19.70])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 06:52:08 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Paul Gardiner <lists@glidos.net>, intel-gfx@lists.freedesktop.org
In-Reply-To: <ac472118-be43-dc8d-87a3-c4d17c9d9f26@glidos.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ac472118-be43-dc8d-87a3-c4d17c9d9f26@glidos.net>
Date: Tue, 17 Nov 2020 16:52:05 +0200
Message-ID: <87sg98ox2i.fsf@intel.com>
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

On Thu, 29 Oct 2020, Paul Gardiner <lists@glidos.net> wrote:
> I use an open source DVR called MythTV. I've just swapped from using 
> nvidia graphics to intel graphics. Generally it's working great, but 
> I've run into one thing I used to do with the old system that I cannot 
> find out how to achieve with the new.
>
> MythTV doesn't currently entirely handle starting without a TV 
> connected. With nvidia graphics I could specify, within the X config, 
> the "ConnectMonitor" and "CustomEDID" options to fool MythTV into 
> thinking there was a TV. With intel graphics I can load EDID, but so far 
> I haven't discovered an equivalent of the "ConnectedMonitor" option.

Sorry for the delay, I seem to have missed this.

Please try a kernel command-line parameter to force enable the
connector.

video=TV-1:e

Assuming the connector name is "TV-1"; replace with whatever you have.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
