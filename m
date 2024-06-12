Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00549C27C53
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Jun 2024 12:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D6F10E83E;
	Wed, 12 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uVMaBIuC";
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6AB10E0A7
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Jun 2024 12:09:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B98DECE0CF9;
 Wed, 12 Jun 2024 12:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB57C3277B;
 Wed, 12 Jun 2024 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1718194148;
 bh=P9Rh1THPcDZWZ2vIRajiN5C+S0KMFCIZIRBmZaTFeOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVMaBIuCm8/88lNXcZ8tr8M7t7JXvfblWAQx0p/hJY5CdburnXoSSvei1bxVLvF0z
 8zpFSFbPTQw/bd3HvAYDuu9lPiNbzO/1xch2x7dttGVpVY/7MzqwDTp1OXanQFczeJ
 Zd7IolP70hT1mQfk4gnPHYxrPQw19n2PWyZq9uU4=
Date: Wed, 12 Jun 2024 14:09:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: stable@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: Please apply "drm/i915/hwmon: Get rid of devm" to stable trees
 (Option 2)
Message-ID: <2024061257-avalanche-convene-6554@gregkh>
References: <875xv1lu82.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xv1lu82.wl-ashutosh.dixit@intel.com>
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

On Sat, May 25, 2024 at 09:41:33AM -0700, Dixit, Ashutosh wrote:
> Patch subject:		drm/i915/hwmon: Get rid of devm
> Commit ID:		5bc9de065b8bb9b8dd8799ecb4592d0403b54281
> Reason:			Fixes potential kernel crash listed in
> 			https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10366
> Kernel versions:	6.2 and later
> 

Now queued up, thanks.

greg k-h
