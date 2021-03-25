Return-Path: <SRS0=Bn5a=IX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAF9C433C1
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 09:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32FB61A14
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Mar 2021 09:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32FB61A14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C136ECF3;
	Thu, 25 Mar 2021 09:42:01 +0000 (UTC)
X-Greylist: delayed 146431 seconds by postgrey-1.36 at gabe;
 Thu, 25 Mar 2021 09:41:59 UTC
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25406ECF3
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Mar 2021 09:41:59 +0000 (UTC)
Date: Thu, 25 Mar 2021 09:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616665317;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=mjOUrGvLzSAdMaWBPIf4xwsJldbr0+695vJNm0XNjpUUBDB5bX1EUgR9x4FyVvD2Y
 UUn4rk5cBnsp1wgqb+weS0b3suBnmNHkntbFOe3YGxgHq/fe9yTkm2Uqo/DeXFi3hr
 NmOCZQHT2bF7FpYLFRjiv3yIUjUJ3khtvQNAUn2s8Yu2s2r9DExG23dcX4M7JzyZS9
 aeLbDgUweZ27BAz99TJvqnnnnMQxoWKKP4HMnlU0KkhS2qPFaajeZEQ0dytBO3Ewbq
 BU+arlR7EckBZ2odXffEahhJloF2HSGomejTFomF/6YPZlCtcisogbVnXk2zrWs8uZ
 aQ2pZNVoDuw+Q==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Message-ID: <oMKA4ZguEsopOJVahmttvIOEUJ2taQGAFuPom_BRvvAhbAQNdgbYwU26xjz8-FH6Mj5hyYA6iGKjhjxG63hDj_Fe3dbI72lz9C3wySfuBAs=@emersion.fr>
In-Reply-To: <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
References: <20210324211041.1354941-1-daniel.vetter@ffwll.ch>
 <20210324211041.1354941-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/doc: Add RFC section
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
