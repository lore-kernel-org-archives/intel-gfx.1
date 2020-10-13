Return-Path: <SRS0=Vt61=DU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9FBC433DF
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 12:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1C4220870
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 12:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1C4220870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DAB6E8D5;
	Tue, 13 Oct 2020 12:03:47 +0000 (UTC)
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23B6E8D5
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 12:03:45 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 9D9272002C93
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 12:03:43 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="dW0FUHzm"
Date: Tue, 13 Oct 2020 12:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1602590619;
 bh=xJSyQzG/wc/eo2ONFO3MxyEkoIOfZSkrghLMbcUyQAg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dW0FUHzmf4SQsmiETrMSH4Av2aeAGeg0ShH+Bd4aGcc4Xwt69ocpvsOcKx7BWpczu
 i+o71u7MBa8iuJDnoAVyBXAmJ6raRLt2jM8fqucX41jDc6gJhbuIyXmI0LaVWavZO2
 SKtLFZWQ3vrpd2y9D9sFK3IqA3pVBieLXXv62uP5osjeGokhrnqC1FiBLG0BCIdu20
 DvIjoHZz2uT88BBZXWaxOk1R4P9+TjcSdYaTIf7094vNJ4t6GXL3v8NZSLD0g3HvCy
 LncPhPvtx2GDCkwIGeUPSdznJcRz/vfqckgukjnK8yo4meFtEzXCL3TuHEJKEBMVs0
 Kikz7jSugC8pA==
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <5OoxGqCN-WPshwwU1WctxYhcJ3OqwLmph6wWhq-ZgTfKPhz1WQLGJlZZN1p2oM082DxSn0cv-nUP9bLJcdtoaK8FLvaXxoa5TB2N0LEy3LI=@emersion.fr>
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

> +/**
> + * DOC: Plane scaling filter property
> + *
> + * SCALING_FILTER:
> + *
> + *	Indicates scaling filter to be used for plane scaler
> + *
> + *	The value of this property can be one of the following:
> + *	Default:
> + *		Driver's default scaling filter
> + *	Nearest Neighbor:
> + *		Nearest Neighbor scaling filter
> + *
> + * Drivers can set up this property for a plane by calling
> + * drm_plane_create_scaling_filter_property
> + */

Similarily, this can be moved in "Plane Composition Properties".

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
