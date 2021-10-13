Return-Path: <SRS0=fYpC=PB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F79C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 19:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C383611CE
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 19:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C383611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72966EAC1;
	Wed, 13 Oct 2021 19:31:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBA96EA92
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Oct 2021 19:31:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="313713442"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313713442"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 12:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="626480226"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 13 Oct 2021 12:31:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 Oct 2021 22:31:39 +0300
Date: Wed, 13 Oct 2021 22:31:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "Zhao, Yakui" <yakui.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Message-ID: <YWc0GwvlY4DQz84Y@intel.com>
References: <20211013010046.91858-1-jose.souza@intel.com>
 <YWanuyKbmIDWOGZ3@intel.com>
 <e85ffbe78d15f8714e88edcdf4d3112c59ae971f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e85ffbe78d15f8714e88edcdf4d3112c59ae971f.camel@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Remove memory frequency
 calculation
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 07:17:14PM +0000, Souza, Jose wrote:
> On Wed, 2021-10-13 at 12:32 +0300, Ville Syrjälä wrote:
> > On Tue, Oct 12, 2021 at 06:00:46PM -0700, José Roberto de Souza wrote:
> > > This memory frequency calculated is only used to check if it is zero,
> > > what is not useful as it will never actually be zero.
> > > 
> > > Also the calculation is wrong, we should be checking other bit to
> > > select the appropriate frequency multiplier while this code is stuck
> > > with a fixed multiplier.
> > 
> > I don't think the alternate ref clock was ever used.
> > At least I don't recall ever seeing it.
> > 
> > The real problem with this is that IIRC this is just the last
> > requested frequency. So on a system with SAGV this will
> > change dynamically.
> > 
> > > 
> > > So here dropping it as whole.
> > 
> > We have a second copy of this in gen6_update_ring_freq(). Rather
> > than removing one and leaving another potentially broken one behind we
> > should probably just consolidate on a single implementation.
> 
> gen6_update_ring_freq() is related to GPU frequency not memory, don't look related at all to me.
>

GPU, CPU and memory clocks are all needed there, at least on some
platforms. I forget which ones did what exactly.

-- 
Ville Syrjälä
Intel
