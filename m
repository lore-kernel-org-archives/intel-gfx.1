Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320AD11183
	for <intel-gfx@archiver.kernel.org>; Thu, 27 Nov 2025 14:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7F910E07D;
	Thu, 27 Nov 2025 14:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JS70pH5t";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BEE10E07D
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 Nov 2025 14:06:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B0D6B4192A;
 Thu, 27 Nov 2025 14:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8A0C113D0;
 Thu, 27 Nov 2025 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764252403;
 bh=A2dkFCwTd827pYFxBrfRCLQSbbFvk24cld3CkJX4wuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JS70pH5tjiUmidu/0Nv7KyHuGheYpw9/ZKHgZptG+0bSGMXX34LTDIvLWMpybsxeX
 Blu0V+4DngAtyX84OBf/en3kR7eeyGLtjCwik+F6tISW73Qfo+hSxxXRoNVxJHqt4L
 O93oa33y37UB/sCek2HtfGd/aL2TpWxsm8eIFjsQ=
Date: Thu, 27 Nov 2025 15:06:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: stable@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: please backport 8c9006283e4b ("Revert "drm/i915/dp: Reject HBR3
 when sink doesn't support TPS4"")
Message-ID: <2025112734-cartel-famished-3e7a@gregkh>
References: <ae09d103eb4427f690685dc7daf428764fed2421@intel.com>
 <5b080d938b4a6132e407d956a37fd079dbd71a67@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b080d938b4a6132e407d956a37fd079dbd71a67@intel.com>
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

On Wed, Nov 26, 2025 at 12:45:04PM +0200, Jani Nikula wrote:
> On Wed, 26 Nov 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> > Stable team, please backport
> >
> > 8c9006283e4b ("Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"")
> >
> > from v6.18-rc1 to v6.15+. It's missing the obvious
> >
> > Fixes: 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support TPS4")
> 
> Oh, please *also* backport
> 
> 21c586d9233a ("drm/i915/dp: Add device specific quirk to limit eDP rate to HBR2")
> 
> along with it, as it'll fix what the revert breaks.

Both now queued up, thanks.

greg k-h
