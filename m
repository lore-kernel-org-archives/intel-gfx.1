Return-Path: <SRS0=UFhG=JN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21AEC433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 06:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3CB6113D
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 06:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3CB6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C756EB25;
	Fri, 16 Apr 2021 06:30:23 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E526EB25
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Apr 2021 06:30:22 +0000 (UTC)
Date: Fri, 16 Apr 2021 06:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1618554619;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=r8GpbchaiE6TeGeH2mTTPaYfY4MlNMJ7+h/tnOCSZb0KFXDbRb9F7tST7dd6vzJ6R
 PBrYm1zDrFz6LUR1D4KIuZx9DmMFFILOthD4mv+BiZ/07wxMWU/PMD/jCXc9IfuiB7
 xJd1R7ucECxapsOhpkt+sOnfAIizGn2qaO+0iilWjZdw4KJwMz3rwYgbE9Tdh9L8Li
 MAK9yREp+/vzlWhyrJqoxHAs3uTnbX84QFv6JUxuleulwwZQtUOEGe0MY6DDpDMYYt
 +Exfq9HssaFYF3r+BsesZ1iFxeCBQBVYu9w8REZSRgqVF/Iuhj0jfaU44PsIekJ4nb
 iR3zU090AgA+A==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Message-ID: <csmR47SnJtt7IWUT4j5GAXY1PUo1353cZy6TyrjqQVynHAAqHEiqWQyuFkfZLj8UWMhzdRiAGPlG31d1hTU7PatWRbjK6v3Zq3WuGT4EACE=@emersion.fr>
In-Reply-To: <20210414090815.453744-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
 <20210414090815.453744-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/modifiers: Enforce consistency between
 the cap an IN_FORMATS
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
