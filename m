Return-Path: <SRS0=UFhG=JN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF524C433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 19:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081D4613B7
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 19:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 081D4613B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD356E12D;
	Fri, 16 Apr 2021 19:04:04 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E4A6E12D;
 Fri, 16 Apr 2021 19:04:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7C9EA491;
 Fri, 16 Apr 2021 19:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C9EA491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1618599841; bh=ANcJnljUldBfsxwsJejbZ737Ohmx9wXvzi8Qa6QBl98=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Xf0bamRDwfDUT5VKqoL3n5oG7fN6htj2nmVM3f7KJIQgSjV61DH4/Q+en10rlpbeU
 iIw+m9Ba21xBcMRswRfp7+R8JuJ9bWLGZOx2qcfu1ltVj2b9/+IwyKff5tte9IFmyL
 4U33Lkn3wTtz5jr9rpvXMa96BI2y+3OPDqe3lNSo7ZJuDpPP52+NkI3LWHbfQxsmkp
 Ltajrvx1E8EVAGNJlYLwor1fXey2AMsKUQT1zbG3waoiVl9foFqja+9YbHfiQhyTEq
 FhOBaoIXDiiOOe2Y23AmOhwPhUscEf5425BTugVpPvcRSC6OBcjCFCzAHOEtVi2mta
 ul4BR67Khqujg==
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Vetter <daniel@ffwll.ch>, Ian Romanick <idr@freedesktop.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
In-Reply-To: <CAKMK7uH-K=CmMtwi3FcVsGdTGRwYtxDXhAgohz1_WWQL-RQzEw@mail.gmail.com>
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-3-matthew.auld@intel.com>
 <5de63e24-51f0-71eb-b992-484da998e65f@freedesktop.org>
 <CAKMK7uH-K=CmMtwi3FcVsGdTGRwYtxDXhAgohz1_WWQL-RQzEw@mail.gmail.com>
Date: Fri, 16 Apr 2021 13:04:01 -0600
Message-ID: <87zgxyf3vi.fsf@meer.lwn.net>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [Mesa-dev] [PATCH v3 3/4] drm/i915/uapi: convert
 i915_query and friend to kernel doc
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Fri, Apr 16, 2021 at 12:25 AM Ian Romanick <idr@freedesktop.org> wrote:
>> Since we just had a big discussion about this on mesa-dev w.r.t. Mesa
>> code and documentation... does the kernel have a policy about which
>> flavor (pun intended) of English should be used?
>
> I'm not finding it documented in
> https://dri.freedesktop.org/docs/drm/doc-guide/sphinx.html but I
> thought we've discussed it. Adding linux-doc and Jon Corbet.

It's in Documentation/doc-guide/contributing.rst:

> Please note that some things are *not* typos and should not be "fixed":
> 
>  - Both American and British English spellings are allowed within the
>    kernel documentation.  There is no need to fix one by replacing it with
>    the other.

Thanks,

jon
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
