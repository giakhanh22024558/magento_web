<?php
/**
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
declare(strict_types=1);

namespace Magento\MagentoCloud\Test\Functional\Acceptance;

/**
 * This test runs on the latest version of PHP
 *
 * @group php81
 */
class WizardScd81Cest extends WizardScdCest
{
    /**
     * @var string
     */
    protected $magentoCloudTemplate = '2.4.4';
}
