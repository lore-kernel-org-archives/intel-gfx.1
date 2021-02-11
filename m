Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28446C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 14:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6AC164D92
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 14:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6AC164D92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB916EE2C;
	Thu, 11 Feb 2021 14:18:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7E16E42D
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Feb 2021 14:18:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A0C364EAA;
 Thu, 11 Feb 2021 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613053109;
 bh=80VxV4qEjUjaTOS07HnYGPxsGNaYJYSKYiOb+g4t7k0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TDRACuUUvJu+s88BF2pJD1cqhXSDSGoFKD58Zd0QG5V9WuBdlTLBy5xDQXb6pnY5x
 p2AsGcQQQ6NQzRynpEroj5i38nafgQnsipZrw0GF8w39fE1IoMJaR6MvliHZpR5BmX
 MoEgF2LtvrOJbou+lZ78ROSw2gEsWNdZ11YmGqQs=
Date: Thu, 11 Feb 2021 15:18:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <YCU8szZLx8HtinOV@kroah.com>
References: <16127808794868@kroah.com>
 <20210208175341.8695-1-ville.syrjala@linux.intel.com>
 <20210208175341.8695-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208175341.8695-2-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH stable-5.10 2/2] drm/i915: Skip vswing
 programming for TBT
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 07:53:41PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> commit eaf5bfe37db871031232d2bf2535b6ca92afbad8 upstream.
> =

> In thunderbolt mode the PHY is owned by the thunderbolt controller.
> We are not supposed to touch it. So skip the vswing programming
> as well (we already skipped the other steps not applicable to TBT).
> =

> Touching this stuff could supposedly interfere with the PHY
> programming done by the thunderbolt controller.
> =

> Cc: stable@vger.kernel.org
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210128155948.13678-=
1-ville.syrjala@linux.intel.com
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> (cherry picked from commit f8c6b615b921d8a1bcd74870f9105e62b0bceff3)
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> (cherry picked from commit eaf5bfe37db871031232d2bf2535b6ca92afbad8)
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Both n ow queued up,t hanks.

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
