Return-Path: <SRS0=Vt61=DU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C20C433DF
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 12:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A5A221FC
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 12:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0A5A221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213F46E093;
	Tue, 13 Oct 2020 12:11:04 +0000 (UTC)
X-Greylist: delayed 533 seconds by postgrey-1.36 at gabe;
 Tue, 13 Oct 2020 12:11:02 UTC
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A146E093
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 12:11:02 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 27B532000745
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 12:02:08 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="LPYCieDY"
Date: Tue, 13 Oct 2020 12:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1602590523;
 bh=9yNp+3guKlZH6Yh913kKM9tW4diOYxSVBxkspzPmL58=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=LPYCieDYO0Xbzme3imBwNo+WoMpaFKDpo+r+VySpxat8rM+LheSpEjIZIE5YO4F6Z
 zKwD9GndiCrBJIeneA/8zL5awwxfvlzh3H3ngzQsUj7UYBK0v1x96gC4qU8tbVGKG/
 9MBZUnbUTlmD7HIujF2jwgX6ZHDJnpispAjb3iklbp9Eo6drYZ1geiQ/JjEQWaNRnE
 dmJaNxkPL8U5ScFKhmfIFIkLZFZpUEZpwGpwFJtKQuyr/ZkDsQu2Kk/8oLCYeQx9BG
 yL5y1DJ9z3CqwpbJ+WHvX65AivlnRqw35gfNI7+JgSanqre2Dq7kXGYGWnQ6x1zTRc
 js4BZSALU/Xqg==
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <0iLdVk_D6CK0SMJ_pGgP02tBfYnMRw9u2E7eK_PkVQcKxXRRc5j2Td1466kkOFsQXn7joJzWDxTIHyfrVqD4h6CuIMiNXmoUD80yOlapgvw=@emersion.fr>
In-Reply-To: <20201012184130.937-2-pankaj.laxminarayan.bharadiya@intel.com>
References: <20201012184130.937-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20201012184130.937-2-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v6 1/5] drm: Introduce plane and CRTC
 scaling filter properties
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
 "daniels@collabora.com" <daniels@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lorusak@gmail.com" <lorusak@gmail.com>,
 "themagnificentmrg@gmail.com" <themagnificentmrg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Monday, October 12, 2020 8:41 PM, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:

> +/**
> + * DOC: CRTC scaling filter property
> + *
> + * SCALING_FILTER:
> + *
> + *	Indicates scaling filter to be used for CRTC scaler
> + *
> + *	The value of this property can be one of the following:
> + *	Default:
> + *		Driver's default scaling filter
> + *	Nearest Neighbor:
> + *		Nearest Neighbor scaling filter
> + *
> + * Drivers can set up this property for a CRTC by calling
> + * drm_crtc_create_scaling_filter_property
> + */

Can we put this under the existing "Standard CRTC Properties" doc comment
instead? I'd prefer to avoid having a lot of different headings for properties.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
