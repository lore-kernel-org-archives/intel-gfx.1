Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C11C5516D
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A3210E1EC;
	Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9DRJrkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B05610E1EC
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2026 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785499007; x=1817035007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YH2b8+KEu1E8MCfsW4QKOlpZoyCzRp6sPSt9CGvz4Eo=;
 b=H9DRJrkTasMav13RvSDhr2NgWiHs9aX31/3emlqbsjPbXbwfx+Ee6MMi
 yslZ5S0FO83t7xqBk/kPEFQWVik07pvvnNVVIslWGvxt8pX0CJuITPcFF
 4SOU/VXCrANctrh3mpTRmZ6Kgh4Fxhpwa1TFtV+cmzVyVhKi6jTcD5pSj
 Hqvm3IdhVxebjjBcKQB2ZOn90Nkgw5eXYu0MdQn2vCH2Qe6rdIH8uND7m
 dvgpCJzfDR6jAIPZLqaLyDIruKFHD0MnNfLDS0PaZ5WjUS55Bu1D1Pqek
 iUNEiuoC7BImz/EKRlr7wOb4FUQxutEbyBoJ0s1jSGhHljL4lcDvuCYMy A==;
X-CSE-ConnectionGUID: Kl83SCgkSACW67L56ekp3Q==
X-CSE-MsgGUID: XfuOQORGQDePDMjqGudvag==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73661112"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="73661112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:56:46 -0700
X-CSE-ConnectionGUID: BanyUaj4Tgig1uwzN/yxNg==
X-CSE-MsgGUID: vxjkjXzmQoGo3uERCy7ZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="264049119"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.52])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:56:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH v4 2/2] drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm
 value
In-Reply-To: <20241217201301.3593054-3-dnyaneshwar.bhadane@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20241217201301.3593054-1-dnyaneshwar.bhadane@intel.com>
 <20241217201301.3593054-3-dnyaneshwar.bhadane@intel.com>
Date: Fri, 31 Jul 2026 14:56:40 +0300
Message-ID: <5b06b71a00245d777f6e1f178be83b6a4d29cb2c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 18 Dec 2024, Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com> wrote:
> +/*
> + * Some ARLs SoCs have the same drm PCI IDs, so need a helper to differentiate based
> + * on the host bridge device ID to get the correct txx_mics value.
> + */
> +static bool is_arrowlake_s_by_host_bridge(void)
> +{
> +	struct pci_dev *pdev = NULL;
> +	u16 host_bridge_pci_dev_id;
> +
> +	while ((pdev = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, pdev)))
> +		host_bridge_pci_dev_id = pdev->device;
> +
> +	return pdev && IS_ARROWLAKE_S_BY_HOST_BRIDGE_ID(host_bridge_pci_dev_id);
> +}

I was just reading the code, and stumbled on this two years after it was
merged.

The function *always* returns false, because pdev is always NULL when
the while loop terminates.


BR,
Jani.


-- 
Jani Nikula, Intel
