Return-Path: <SRS0=BQGL=OY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27678C433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Oct 2021 10:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFC661222
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Oct 2021 10:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEFC661222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4CE6E9C1;
	Mon,  4 Oct 2021 10:51:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E63B6E9C1
 for <intel-gfx@lists.freedesktop.org>; Mon,  4 Oct 2021 10:51:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="311580809"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="311580809"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 03:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="482892331"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Oct 2021 03:51:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 13:51:34 +0300
Date: Mon, 4 Oct 2021 13:51:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>, Karthik B S <karthik.b.s@intel.com>
Message-ID: <YVrctgdJ8EYdW9i0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: comment
Subject: [Intel-gfx] i915 MST HDCP code looks broken
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

Hi,

I took a quick peek at intel_dp_add_mst_connector() the other day and
noticed that it calls intel_dp_hdcp_init() and passes in the SST
dig_port. And digging in a bit further that seems to clobber all
kinds of things in dig_port->hdcp_port_data. This looks rather
broken to me.

So has anyone actually thought what happens if you first use
MST on the port, and then later switch to SST on the same port?

-- 
Ville Syrjälä
Intel
